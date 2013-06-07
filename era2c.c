#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ST unsigned long
#define SW (sizeof(ST) * 8) 

// 5 7 . 11 13 .  17 19 . 23 25 . 29 31 . 35 37 . 41 43 . 47 49 . 53 55 . 59 61 . 65 67 . 71 73 . 77 79 . 
//
//

void doSieve(ST max, void (*action)(ST)){

    ST *sieve = calloc(((max) / (2 * SW)) + 3, sizeof(ST)); 

    // action
    ST i;
    for(i = 0; i < ((max) ) / 3; ++i) 
    { 
        // printf(" i = %lu, p = %lu, %lu \n", i, p, i/SW);
        // fflush(0);
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            ST p = 5 + 2*(i + i/2);

            if(p > max){
               break;
            }
            ST l = p-2;
            while(l < max/p){
                l+=2;
                if(l%3 == 0){
                    continue;
                }
                int j = (l*p-5)/2 - (l*p-5)/6;
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
            }
            // action
            // if(p % 150000 == 1) printf("%lu\n", p);
        } 
    } 
}

inline void modPrint(ST p){
    if(p % 1000 == 1) printf("%lu\n", p);
}

int main(){
    // unsigned long max = 10000000UL;
    unsigned long max = 10000000UL;
    // unsigned long max = 100UL;

    doSieve(max*log(max)*log(log(max)) + 100, 0);
    // check(13);

    return 0;
}
