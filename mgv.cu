// Includes
#include <stdio.h>
#include <string.h>

#define ST unsigned int
#define SW sizeof(ST)*8

// per thread, so only small part of the card-memory, in Bytes
#define CUDABLOCK 512
// #define FIRSTPRIMES 9
#define FIRSTPRIMES 11

// Variables
ST * isComposite;
unsigned int * d_isComposite;
ST * d_initPrimes;

unsigned int initPrimes[FIRSTPRIMES] = {5,7,11,13,17,19,23,29,31,37,41};

void Cleanup(bool);

// check
void initPrim(int bDim, int bIdx, int thIdx, ST * C, const int offset, const unsigned int *d_initPrimes, int N)
{
    unsigned int i = bDim * bIdx + thIdx;

    unsigned long block = CUDABLOCK * SW;

    unsigned long base = block*i + offset ;
    unsigned long max = base + block;

    for(int l = 0; l < FIRSTPRIMES; l++){
        unsigned long p = d_initPrimes[l];
        unsigned long back = base % (2*p);
        unsigned int j,k;
        j = (p*p-5)/2 - (p*p-5)/6 ;
        if(p%3 == 1){
            k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
        }
        else{
            k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
        }
        if(i + offset > 0){
            j += base - back;
            k += base - back;
        }


        if(j < base){
            j += 2*p;
            C[k / SW] |= ((ST)1 << ((k) % SW)); 
            k += 2*p;
        }

        if(max > N){
            max = N;
        }

        printf("%d, %lu, %lu   %lu %lu \n", i, j, k, block, back);
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

// Device code
__global__ void initPrim(ST * C, const int offset, const unsigned int *d_initPrimes, int N)
{
    unsigned int i = blockDim.x * blockIdx.x + threadIdx.x;

    unsigned long block = CUDABLOCK * SW;

    unsigned long base = block*i + offset ;
    unsigned long max = base + block;

    for(int l = 0; l < FIRSTPRIMES; l++){
        unsigned long p = d_initPrimes[l];
        unsigned long back = base % (2*p);
        unsigned int j,k;
        j = (p*p-5)/2 - (p*p-5)/6 ;
        if(p%3 == 1){
            k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
        }
        else{
            k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
        }
        unsigned long diff = k-j;

        if(i + offset > 0){
            j = base + (p-5)/2 - (p-5)/6;
            k = diff + j;
        }

        /*
        C[10*i+0] = base;
        C[10*i+1] = i;
        C[10*i+2] = j;
        C[10*i+3] = k;
        C[10*i+4] = p;
        return;
         */
        if(j < base){
            j += 2*p;
            C[k / SW] |= ((ST)1 << ((k) % SW)); 
            k += 2*p;
        }

        if(max > N){
            max = N;
        }

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
    printf("Memory preset \n");
    int max = 32*8* CUDABLOCK;

    size_t size = max; 

    size_t b_size = size;

    cudaError_t error;

    // Allocate input vectors h_A and h_B in host memory
    isComposite = (ST*)malloc(size* sizeof(ST));
    if (isComposite == 0) Cleanup(false);

    unsigned long i;

    printf("Setting %i bytes\n", b_size);
    // Allocate vectors in device memory
    // error = cudaMalloc((void**)&d_isComposite, SW*(b_size)*sizeof(ST));
    error = cudaMalloc((void**)&d_isComposite, max*sizeof(ST));
    if (error != cudaSuccess){
        printf("mal isC: error = %d / %d : \n", error, cudaSuccess );
        Cleanup(false);
    }

    error = cudaMalloc((void**)&d_initPrimes, FIRSTPRIMES*sizeof(ST));
    if (error != cudaSuccess){
        printf("mal ini: error = %d / %d : \n", error, cudaSuccess );
        Cleanup(false);
    }


    error = cudaMemcpy(d_initPrimes, initPrimes, FIRSTPRIMES*sizeof(unsigned int), cudaMemcpyHostToDevice);
    if (error != cudaSuccess){
        printf("2. error = %d / %d\n", error, cudaSuccess);
        Cleanup(false);
    }

    printf("init 0.04 at %lu  %lu bytes to 0\n", d_isComposite, max);
    cudaMemset(d_isComposite, 0, max*sizeof(ST));
    if (error != cudaSuccess) Cleanup(false);

    // Invoke kernel

    int threadsPerBlock = 16;
    int blocksPerGrid=1;

    initPrim<<<blocksPerGrid, threadsPerBlock>>>(d_isComposite, 0, d_initPrimes, max);
    error = cudaGetLastError();
    if (error != cudaSuccess){
        printf("error = %d / %d : %dx%d / %d\n", error, cudaSuccess, blocksPerGrid, threadsPerBlock);
        Cleanup(false);
    }
// #ifdef _DEBUG
    error = cudaThreadSynchronize();
    printf("sync error = %d / %d : %dx%d / %d\n", error, cudaSuccess, blocksPerGrid, threadsPerBlock);
    if (error != cudaSuccess) Cleanup(false);
// #endif

    // Copy result from device memory to host memory
    error = cudaMemcpy(isComposite, d_isComposite, max, cudaMemcpyDeviceToHost);
    if (error != cudaSuccess){
        printf("2. error = %d / %d\n", error, cudaSuccess);
        Cleanup(false);
    }
    // */

    //*
    for (i = 0; i < max; ++i) {
        unsigned long long p = i;
        p += i/2; p<<=1; p += 5;
        int p_is_comp = 0, p_is_marked = 0;

        /*
        printf("hu %d %lu\n", i, isComposite[i]);
        if(i > 90){
            break;
        }
        continue;
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
            exit(1);
        }
        if( !p_is_comp && p_is_marked){
            printf(" %lu: %llu not comp %llu but marked \n", i, p, p_is_comp);
            exit(1);
        }
    }
    Cleanup(true);
}

void Cleanup(bool noError)
{
    cudaError_t error;

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

