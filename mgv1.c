// Includes
#include <stdio.h>
#include <string.h>

#define ST unsigned long int
#define SW (sizeof(ST)*8)

#define PRT unsigned short

// per thread, so only small part of the card-memory, in Bytes
#define CUDABLOCK 2048
// #define FIRSTPRIMES 9
#define FIRSTPRIMES 16

#define LOGP 4
// Variables
ST * isComposite;
ST * d_isComposite;

int false = 0;
int true = 1;
void Cleanup(bool);
PRT initPrimes[FIRSTPRIMES] = {5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61};

void dumpBits(ST *isC, int loops, int max, char *tg){
    for (int i = 0; i < loops*max; ++i) {
        unsigned long long p = i;
        p += i/2; p<<=1; p += 5;

        //*
        if(isC[i/SW] & (1UL << (i%SW))){
            printf("%4d %6d _1 %d %s\n", i, p, i/SW, tg);
        }
        else{
            printf("%4d %6d _0 %d %s\n", i, p, i/SW, tg);
        }
    }
}

// Device code
void initPrim(int blockDim, int blockIdx, int threadIdx, ST * C, const int offset, unsigned long N)
{
    unsigned int i = blockDim * blockIdx + threadIdx;
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
            if(p==LOGP)
                printf(">j= %lu, k = %lu, offset = %lu, base = %lu, sum=%lu\n", j,k,offset,base, base + j);
            j = base + j % (2*p) - base % (2*p);
            k = base + k % (2*p) - base % (2*p);
            if(p == LOGP)
                printf("<j= %lu, k = %lu, offset = %lu, base = %lu, sum=%lu\n", j,k,offset,base, base+j);
            if(j < base){
                j += 2*p;
            }
            if(k < base){
                k += 2*p;
            }
            if(p == LOGP)
                printf(".j= %lu, k = %lu, offset = %lu, base = %lu\n", j,k,offset,base);
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
  // */
        while(j <= max - 2*p){
            C[j / SW] |= ((ST)1 << ((j) % SW)); 
            C[k / SW] |= ((ST)1 << ((k) % SW)); 
            if(p == LOGP)
                printf("uj= %lu, k = %lu, offset = %lu, base = %lu\n", j,k,offset,base);
            j += 2*p;
            k += 2*p;
        }
        if(j < max){
            C[j / SW] |= ((ST)1 << ((j) % SW)); 
            if(p == LOGP)
                printf(" j= %lu,(k = %lu) offset = %lu, base = %lu\n", j,k,offset,base);
        }
        if(k < max){
            C[k / SW] |= ((ST)1 << ((k) % SW)); 
            if(p == LOGP)
                printf("(j= %lu) k = %lu, offset = %lu, base = %lu\n", j,k,offset,base);
        }
    }
}

// Host code
int main(int argc, char** argv)
{
    int threadsPerBlock = 128;
    int blocksPerGrid=1;

    int loops = 64;

    size_t size_ST = blocksPerGrid * threadsPerBlock* CUDABLOCK;
    size_t size_bytes = size_ST * sizeof(ST); 

    // Bits
    unsigned long max = size_bytes*8;

    // Allocate input vectors h_A and h_B in host memory
    isComposite = (ST*)malloc(loops*size_bytes*sizeof(ST));
    if (isComposite == 0) Cleanup(false);
 
    printf("Memory preset %lu bits\n", loops*size_bytes*sizeof(ST)*8);

    // Allocate input vectors h_A and h_B in host memory
    d_isComposite = (ST*)malloc(size_bytes*sizeof(ST));
    if (d_isComposite == 0) Cleanup(false);

    printf("pointers %p  %p  %p \n", isComposite, d_isComposite, isComposite + loops*size_bytes*sizeof(ST));
    unsigned long i;

    memset(isComposite, 0, loops*sizeof(ST)*size_bytes);

    printf("Setting %i bytes\n", size_bytes);
    for(int lp = 0; lp < loops; lp++){
        printf("init at %lu  %lu %l bytes to 0\n", d_isComposite, max, isComposite);
        memset(d_isComposite, 0, size_bytes);

        // Invoke kernel

        for(int thr = 0; thr < threadsPerBlock; thr++){
            initPrim(0, 0, thr, d_isComposite, lp*max, max);
            // dumpBits(isComposite, 1, 1000, "inside loop ");
            // dumpBits(isComposite, lp, 5000, "isC");
            // dumpBits(d_isComposite, lp, 5000, "d_isC");
        }
        // printf("after thr loop: %p  %p %d %d\n", isComposite, d_isComposite, lp, size_ST);
        // dumpBits(isComposite, lp+1, 10000, "before copy");
        memcpy(isComposite+lp*size_ST, d_isComposite, size_bytes);
        // dumpBits(isComposite, lp+1, 10000, "after copy");
    }

    // Copy result from device memory to host memory
    // */

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
        }
        if( !p_is_comp && p_is_marked){
            printf(" %lu: %llu not comp %llu but marked \n", i, p, p_is_comp);
        }
    }
    Cleanup(true);
}

void Cleanup(int noError)
{
    // Free host memory
    if (isComposite)
        free(isComposite);
    // Free host memory
    if (d_isComposite)
        free(d_isComposite);

    exit(0);
}

