/* Vector addition: C = A + B.
 *
 * This sample is a very basic sample that implements element by element
 * vector addition. It is the same as the sample illustrating Chapter 3
 * of the programming guide with some additions like error checking.
 *
 */

// Includes
#include <stdio.h>
#include <string.h>

#define ST int
#define SW sizeof(ST)*8

// Variables
ST * isComposite;
ST * d_isComposite;
int initPrimes[9] = {5,7,11,13,17,19,23,29,31};

void Cleanup(bool);

// Device code
__global__ void initPrim(ST * C, const int initPrimes[], int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    for(int j = 0; j<24; j++){
        if(24*i+j < N){
            C[24*i+j] = 24*i+j - i;
        }
    }
}

// Host code
int main(int argc, char** argv)
{
    printf("Memory preset \n");
    int max = 600UL;

    size_t size = max; 
    
    size_t b_size = size;

    cudaError_t error;

    // Allocate input vectors h_A and h_B in host memory
    isComposite = (ST*)malloc(size* sizeof(ST));
    if (isComposite == 0) Cleanup(false);

    int i;

    printf("Setting %i bytes\n", b_size);
    // Allocate vectors in device memory
    error = cudaMalloc((void**)&d_isComposite, 8*b_size*sizeof(ST));
    if (error != cudaSuccess) Cleanup(false);
    
    printf("init 0.04 at %lu  %i bytes to 0\n", d_isComposite, b_size*sizeof(ST));
    cudaMemset(d_isComposite, (int)1, 8*b_size*sizeof(ST));
    if (error != cudaSuccess) Cleanup(false);

    // Invoke kernel
   
    int threadsPerBlock = 16;
    int blocksPerGrid = (b_size*8 + threadsPerBlock - 1) / threadsPerBlock/24;
    initPrim<<<blocksPerGrid, threadsPerBlock>>>(d_isComposite, initPrimes, b_size*8);
    error = cudaGetLastError();
    printf("error = %d / %d : %dx%d / %d\n", error, cudaSuccess, blocksPerGrid, threadsPerBlock, b_size);
    if (error != cudaSuccess) Cleanup(false);
#ifdef _DEBUG
    error = cudaThreadSynchronize();
    if (error != cudaSuccess) Cleanup(false);
#endif

    // Copy result from device memory to host memory
    // h_C contains the result in host memory
    error = cudaMemcpy(isComposite, d_isComposite, b_size*sizeof(int), cudaMemcpyDeviceToHost);
    printf("2. error = %d / %d\n", error, cudaSuccess);
    if (error != cudaSuccess) Cleanup(false);
    
    for (i = 0; i < b_size; ++i) {
        printf(" . %lu : ", isComposite[i]);
        /*
        if(isComposite[i/SW] & (1UL << (i%SW))){
            printf("_1\n");
        }
        else{
            printf("_0\n");
        }
        */
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
    
        printf("\nPress ENTER to exit...\n");
        fflush( stdout);
        fflush( stderr);
        getchar();

    exit(0);
}

// Allocates an array with random float entries.
void RandomInit(float* data, int n)
{
    for (int i = 0; i < n; ++i)
        data[i] = rand() / (float)RAND_MAX;
}

