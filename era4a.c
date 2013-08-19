#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <xmmintrin.h>

#define SL unsigned long long

#define ST unsigned long long
#define SW (sizeof(ST) * 8) 

// size in bit
SL patternSize;
SL memSize=8ULL*1024*1024*1024;
// SL memSize=8*1024*32;
// SL memSize=800000000UL;

ST *C;
ST *patternCache;


void dumpBits(ST *l, int n){
    for(int j = 0; j < n; j++){
        int i;
        for (i = 0; i < SW; ++i) {
            if(l[j] & (1UL << i)){
                printf("1");
            }
            else{
                printf("0");
            }
        }
        printf("\t %llu \n", l[j]);
    }
}
void preparePattern(){

    char primes[8] = {5,7,11,13,17,19,23,27};

    char add[256] = {0};
    char pos[256] = {0};
    patternCache = (ST*)(calloc(8,32*sizeof(ST)));

    long initPrim = 0;
    ST offset=0;
    for(int i=0; i<8; i++){
        int p = primes[i];
        pos[i] = offset;

        for(int j=0; j<p-1; j++){
            add[offset + j] = 1;
        }
        add[offset + p - 1] = 1-p;

        int j = (p-5)/2 - (p-5)/6;
        initPrim |= (1ULL << j);


        while(j < p*64){
            patternCache[offset + j/64] |= 1UL << (j%64);
            j += 2*p;
        }

        j = (5*p-5)/2 - (5*p-5)/6;
        while(j < p*64){
            patternCache[offset + j/64] |= 1UL << (j%64);
            j += 2*p;
        }

        offset += p;
    }
    // dumpBits(patternCache, 250);
    ST * wrk = C;
    
    asm("; nop");
    for(ST i=0; i<memSize/64/2; i++){
        unsigned long long ll[2];
       
        unsigned long long l;
        char j;
        l = 0;
        j = 0;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;

        // _mm_storeh_pi((__m64*)&l,ll);
        ll[0] = l;

        l = 0;
        j = 0;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;
        l |= patternCache[pos[j]];
        pos[j] += add[pos[j]];
        j++;

        ll[1] = l;
        // _mm_storel_pi((__m64*)&l,ll);
        // _mm_stream_ps((float *)wrk, ll);
        // wrk += 2;
        /*
        asm(" mov	QWORD PTR [r15], rdx"
	        " mov	QWORD PTR [r15+8], rax"
	        " add	r15, 16 "
           );
        // */
        *wrk++ = ll[0];
        *wrk++ = ll[1];
    // */
    }
    C[0] &= ~initPrim;
    dumpBits(C, 32);
}

/*
void doSieve(SL max, void (*action)(SL)){

    // ST l = preparePattern(max, action);
    ST l = -1;
    printf("ds C = %p\n",C);
    // dumpBits(C, 40);
    for(ST i = l; i < max / 3; ++i) 
    { 
        if(!(C[i / SW] & ((SL)1 << (i % SW)))) 
        { 
            SL p = 5 + 2*(i + i/2);
            // printf(" i = %lu, p = %lu, %lu \n", i, p, i/SW);
            if(action){
              action(p);
            }

            if(p > max){
               break;
            }
            SL j = (p*p-5)/2 - (p*p-5)/6;

            // printf(" l_0: %lu  %lu %lu / %lu\n", p, p*p, j, p%3);
            SL k;
            if(p%3 == 1){
                k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
            }
            else{
                k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
            }

            while(k < max/3){
                C[j / SW] |= ((ST)1 << (j % SW)); 
                j += 2*p;
                C[k / SW] |= ((ST)1 << (k % SW)); 
                k += 2*p;
            }
            if(j < max/3){
                C[j / SW] |= ((ST)1 << (j % SW)); 
            }
            // if(p % 10000 == 1) printf("%lu\n", p);
            // if(action) action(p);
        } 
    } 
}

void modPrint(SL p){
    static long anz = 0;
    anz++;
    if(anz % 1000 == 7) printf("%lu %llu\n", anz, p);
}
*/

int main(){
    printf("hu!\n");
    C = (ST*)malloc((memSize/256 + 32)*32); 
    if(! C){
        exit(1);
    }
    preparePattern();
    printf("end mem: \n");
    dumpBits(C+memSize/64-20, 21);
    // doSieve(memSize,0);

    return 0;
}
