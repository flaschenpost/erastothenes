#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long long

#define ST unsigned long long
#define SW (sizeof(ST) * 8) 

void doSieve(SL max, void (*action)(SL)){

    ST *sieve = calloc(((max) / (2 * SW)) + 3, sizeof(ST)); 
    SL alloc = ((max) / (2 * SW)) + 3;
    SL i;
    SL kStart = 0;
    for(i = 0; i < ((max) ) / 3; ++i) 
    { 
        SL p = 5 + 2*(i + i/2);
        kStart += 2*p;

        // printf(" i = %lu, p = %lu, %lu \n", i, p, i/SW);
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 

            if(p > max){
               break;
            }
            // action(p);
            SL j = (p*p-5)/2 - (p*p-5)/6;
            SL k = kStart;
            // printf("j = %llu, kStart = %llu\n", j,k);

            if(p == 5){
                SL pos = j/SW;

                unsigned long restJ = j%SW;
                unsigned long restK = restJ + (k-j);

                SL pattern = 0;
                SL predef[6] = {0};


                // first pattern extra
                while(restJ < SW){
                    pattern |= (ST)1 << restJ;
                    restJ += 2*p;
                }
                while(restK < SW){
                    pattern |= (ST)1 << restK;
                    restK += 2*p;
                }
                sieve[pos] |= pattern;
                pos++;
                restJ -= SW;
                restK -= SW;
                // printf("pos restJ restK predef %llu %lu %lu %llu \n", pos, restJ, restK, pattern);
                pattern=0;

                for(int i=0; i<p; i++){
                    while(restJ < SW){
                        pattern |= (ST)1 << restJ;
                        restJ += 2*p;
                    }
                    while(restK < SW){
                        pattern |= (ST)1 << restK;
                        restK += 2*p;
                    }
                    predef[i] = pattern;
                    // printf("i restJ restK predef %d %lu %lu %llu \n", i, restJ, restK, pattern);
                    pattern=0;
                    restJ -= SW;
                    restK -= SW;
                }

                while(pos <= max/3/SW){
                    // printf("pos predef %llu %llu \n", pos, predef[(pos-1)%p]);
                    sieve[pos] = predef[(pos-1)%p];
                    pos++;
                }
            }
            else{
                while(k < max/3){
                    // printf("unsetting %llu %llu %llu %llu %llu\n", j, k, j/SW, k/SW, alloc);
                    sieve[j / SW] |= ((ST)1 << (j % SW)); 
                    j += 2*p;
                    sieve[k / SW] |= ((ST)1 << (k % SW)); 
                    k += 2*p;
                }
                if(j < max/3){
                    // printf("unsetting %llu \n", j);
                    sieve[j / SW] |= ((ST)1 << (j % SW)); 
                }
            }
        } 
    } 
}

void modPrint(SL p){
    static long anz = 0;
    anz++;
    if(anz % 1024 == 7) printf("%lu %llu\n", anz, p);
}

int main(){
    // unsigned long max = 10000000UL;
    SL max = 10000000UL;
    // unsigned long max = 500UL;

    // doSieve(max*log(max)*log(log(max)) , &modPrint);
    doSieve((max * log(max) + max * (log(log(max)) - 0.9385)), &modPrint);
    // check(13);

    return 0;
}
