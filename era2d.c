#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long long

#define ST unsigned long long
#define SW (sizeof(ST) * 8) 

// 5 7 . 11 13 .  17 19 . 23 25 . 29 31 . 35 37 . 41 43 . 47 49 . 53 55 . 59 61 . 65 67 . 71 73 . 77 79 . 
//
//
inline void static5(ST *sieve, SL max){

    const SL p=5;
    SL j = (p*p-5)/2 - (p*p-5)/6;
    SL k = ((p+2)*5-5)/2 - (((p+2)*5-5)/2)/3;

    while(k < max/3){
        sieve[j / SW] |= ((ST)1 << (j % SW)); 
        sieve[k / SW] |= ((ST)1 << (k % SW)); 
        j += 2*p;
        k += 2*p;
    }
    if(j < max/3){
        sieve[j / SW] |= ((ST)1 << (j % SW)); 
    }
}

inline void static7(ST *sieve, SL max){

    const SL p=7;
    SL j = (p*p-5)/2 - (p*p-5)/6;
    SL k = ((p+4)*5-5)/2 - (((p+4)*5-5)/2)/3;

    while(k < max/3){
        sieve[j / SW] |= ((ST)1 << (j % SW)); 
        j += 2*p;
        sieve[k / SW] |= ((ST)1 << (k % SW)); 
        k += 2*p;
    }
    if(j < max/3){
        sieve[j / SW] |= ((ST)1 << (j % SW)); 
    }
}
void doSieve(SL max, void (*action)(SL)){

    ST *sieve = calloc(((max) / (2 * SW)) + 3, sizeof(ST)); 
    /*
    ST *sieve;
    if( 0 != posix_memalign((void **)&sieve, 256, (((max) / (2 * SW)) + 3) * sizeof(ST))){
        exit(2);
    }
    memset(sieve, 0, (((max) / (2 * SW)) + 3));
    */
    // if(action) action(3);
    // if(action) action(5);
    // if(action) action(7);
    SL i;
    for(i = 0; i < max / 3; ++i) 
    { 
        // printf(" i = %lu, p = %lu, %lu \n", i, p, i/SW);
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            SL p = 5 + 2*(i + i/2);

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
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
                j += 2*p;
                sieve[k / SW] |= ((ST)1 << (k % SW)); 
                k += 2*p;
            }
            if(j < max/3){
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
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

int main(){
    // unsigned long max = 10000000UL;
    SL max = 10000000UL;
    // unsigned long max = 500UL;

    // doSieve(max*log(max)*log(log(max)) , &modPrint);
    doSieve((max * log(max) + max * (log(log(max)) - 0.9385)), &modPrint);
    // check(13);

    return 0;
}
