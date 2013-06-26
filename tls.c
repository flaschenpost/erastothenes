#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <immintrin.h>

#define SL unsigned long long
#define ST __m256i
#define SW (sizeof(ST) * 8) 

SL max = 80000000ULL;
int p;
// SL max = 900LL;
SL j;
SL k;
ST *C;

void dumpBits(int n){
    int l = ((int *)C)[n];
    int i;
    for (i = 0; i < 8*sizeof(int); ++i) {
        if(l & (1UL << i)){
            printf("1 ");
        }
        else{
            printf("0 ");
        }
    }
    printf("\t %llu \n", l);
}
// */
void doWork(ST *C){

    __m256i reg[16];

    int prims[15] = {5,7,11,13,17,19,23,29,31,37,41,43,47,49,53};

    int kStart = 0;

    // init register
    for(int i=0; i<14; i++){
        int p = prims[i];
        int j = (p*p-5)/2 - (p*p-5)/6;
        int k;
        if(p%3 == 1){
            k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
        }
        else{
            k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
        }

        printf("p = %d, i = %d, j = %d, k = %d\n", p, i, j, k);
        int prep[8] = {0,0,0,0,0,0,0,0};

        while(k < 256){
            printf("p = %d k/32 = %d k%%32 = %d , << = %llu\n", p,  k/32, k%32, 1ULL<<(k%32));
            printf("j/32 = %d j%%32 = %d , << = %llu\n", j/32, j%32, 1ULL<<(j%32));
            prep[k/32] |= (1ULL<<(k%32));
            k += 2*p;
            printf("k/32 = %d k%%32 = %d , << = %llu\n", k/32, k%32, 1ULL<<(k%32));
            prep[j/32] |= (1ULL<<(j%32));
            j += 2*p;
        }
        if(j < 256){
            printf("j/32 = %d j%%32 = %d , << = %llu\n", j/32, j%32, 1ULL<<(j%32));
            prep[j/32] |= (1ULL<<(j%32));
            j += 2*p;
        }
        reg[i] = _mm256_set_epi32(prep[7],prep[6],prep[5],prep[4],prep[3],prep[2],prep[1],prep[0]);
        _mm256_store_si256(C+i, reg[i]);
    }
    for (int i=0; i<1000; i++){
        _mm256_setzero_si256(reg[15]);
    }

}

int main(){
    SL limit = max;
    unsigned long long size_bytes = ((limit/(2*SW)) + 16);
    size_bytes += 64 - size_bytes%64;
    posix_memalign((void **)&C, 32, size_bytes * sizeof(ST));
    ((long long*)C)[0] = 12;

    doWork(C);

    printf("%d %d %d\n", ((int *)C)[0], ((int *)C)[1]);
    printf("\n%llu %llu %llu \n", C[0], C[17], C[limit/(2*SW) - 1]);
    for(int i=0; i<20; i++){
        printf("%3d  ", i*32);dumpBits(i);
    }
    // dumpBits(0);dumpBits(17);dumpBits(limit/(2*SW) - 1);


    
    free(C);
    return 0;
}
