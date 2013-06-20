// Includes
#include <stdio.h>
#include <string.h>

#define ST uint8
#define SW (sizeof(ST)*8)

#define PRT unsigned short

// per thread, so only small part of the card-memory, in Bytes
#define CUDABLOCK 2048
// #define FIRSTPRIMES 9
#define FIRSTPRIMES 16

// Variables
ST * isComposite;
__device__ ST * d_isComposite;

void Cleanup(bool);
PRT initPrimes[FIRSTPRIMES] = {5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61};

// Device code
__global__ void initPrim(ST * C, const int offset, unsigned long N)
{
    unsigned int i = blockDim.x * blockIdx.x + threadIdx.x;
    __const__ PRT d_initPrimes[FIRSTPRIMES] = {5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61};
    // bits
    unsigned long block = CUDABLOCK * SW;

    unsigned long base = block*i + offset ;
    unsigned long max = block*(i+1);

    for(int l = 0; l < FIRSTPRIMES; l++){
        unsigned long p = d_initPrimes[l];
        unsigned long j,k;
        j = (p*p-5)/2 - (p*p-5)/6 ;
        if(p%3 == 1){
            k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
        }
        else{
            k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
        }

        if(base > 0){
            j = base + j % (2*p) - base % (2*p);
            k = base + k % (2*p) - base % (2*p);
            if(j < base){
                j += 2*p;
            }
            if(k < base){
                k += 2*p;
            }
        }
        if(k < j){
            unsigned long tmp = j;
            j = k;
            k = tmp;
        }

        if(max > N){
            max = N;
        }

        j -= offset;
        k -= offset;

        while(j <= max - 2*p){
            C[j / SW] |= ((ST)1 << ((j) % SW)); 
            C[k / SW] |= ((ST)1 << ((k) % SW)); 
            j += 2*p;
            k += 2*p;
        }
        if(j < max){
            C[j / SW] |= ((ST)1 << ((j) % SW)); 
        }
        if(k < max){
            C[k / SW] |= ((ST)1 << ((k) % SW)); 
        }
    }
}

// Host code
int main(int argc, char** argv)
{
    int threadsPerBlock = 128;
    int blocksPerGrid=1;

    int loops = 4;

    size_t size_ST = blocksPerGrid * threadsPerBlock* CUDABLOCK;
    size_t size_bytes = size_ST * sizeof(ST); 

    // Bits
    unsigned long max = size_bytes*8;

    cudaError_t error;

    // Allocate input vectors h_A and h_B in host memory
    isComposite = (ST*)malloc(loops*size_bytes*sizeof(ST));
    if (isComposite == 0) Cleanup(false);
    printf("Memory preset %lu bits\n", loops*size_bytes*sizeof(ST)*8);

    unsigned long i;

    // printf("Setting %i bytes\n", size_bytes);
    // Allocate vectors in device memory
    error = cudaMalloc((void**)&d_isComposite, size_bytes*sizeof(ST));
    if (error != cudaSuccess){
        printf("mal isC: error = %d / %d : \n", error, cudaSuccess );
        Cleanup(false);
    }

    for(int lp = 0; lp < loops; lp++){
        printf("lp %d: init at %lu  %lu %l bytes to 0\n", lp, d_isComposite, max, isComposite);
        cudaMemset(d_isComposite, 0, size_bytes);
        if (error != cudaSuccess) Cleanup(false);

        // Invoke kernel

        initPrim<<<blocksPerGrid, threadsPerBlock>>>(d_isComposite, lp*max, max);
        error = cudaGetLastError();
        if (error != cudaSuccess){
            printf("error = %d / %d : %dx%d / %d\n", error, cudaSuccess, blocksPerGrid, threadsPerBlock);
            Cleanup(false);
        }
        error = cudaThreadSynchronize();
        if (error != cudaSuccess){
            printf("sync error = %d / %d : %dx%d / %d\n", error, cudaSuccess, blocksPerGrid, threadsPerBlock);
            Cleanup(false);
        }
        error = cudaMemcpy(isComposite+lp*size_ST, d_isComposite, size_bytes, cudaMemcpyDeviceToHost);
        if (error != cudaSuccess){
            printf("2. error = %d / %d\n", error, cudaSuccess);
            Cleanup(false);
        }
        // printf("%lu %lu %lu %lu \n", isComposite[lp*size_bytes], isComposite[lp*size_bytes+1], isComposite[lp*size_bytes+2], isComposite[lp*size_bytes+3]);
    }

    //*
    for (i = 0; i < 0*loops*max; ++i) {
        unsigned long long p = i;
        p += i/2; p<<=1; p += 5;
        int p_is_comp = 0, p_is_marked = 0;

        /*
        if(isComposite[i/SW] & (1UL << (i%SW))){
            printf("%4d %6d _1\n", i, 5+2*(i+i/2));
        }
        else{
            printf("%4d %6d _0\n", i, 5+2*(i+i/2));
        }
        // */
        for ( int j = 0; j < FIRSTPRIMES; j++){
            if (p % initPrimes[j] == 0 && p > initPrimes[j]){
                p_is_comp = initPrimes[j];
                break;
            }
        }
        p_is_marked = isComposite[i/SW] & (1UL << (i%SW));
        if( p_is_comp && ! p_is_marked){
            printf(" %lu: %llu comp %llu but unmarked \n", i, p, p_is_comp);
            Cleanup(1);
        }
        if( !p_is_comp && p_is_marked){
            printf(" %lu: %llu not comp %llu but marked \n", i, p, p_is_comp);
            Cleanup(1);
        }
    }
    Cleanup(true);
}

void Cleanup(bool noError)
{
    cudaError_t error;
    printf("cleanup!\n");

    // Free device memory
    if (d_isComposite)
        error = cudaFree(d_isComposite);
    // Free host memory
    if (isComposite)
        free(isComposite);

    error = cudaThreadExit();

    if (error != cudaSuccess)
        printf("Function call failed\nTest FAILED\n");

    exit(0);
}

// Allocates an array with random float entries.
void RandomInit(float* data, int n)
{
    for (int i = 0; i < n; ++i)
        data[i] = rand() / (float)RAND_MAX;
}

