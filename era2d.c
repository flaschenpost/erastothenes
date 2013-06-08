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

    ST i;
    for(i = 0; i < ((max) ) / 3; ++i) 
    { 
        // printf(" i = %lu, p = %lu, %lu \n", i, p, i/SW);
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            ST p = 5 + 2*(i + i/2);

            if(p > max){
               break;
            }
            ST j = (p*p-5)/2 - (p*p-5)/6;

            // printf(" l_0: %lu  %lu %lu / %d\n", l, l*p, j, l%3);
            ST k;
            if(p%3 == 1){
                k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
            }
            else{
                k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
            }

            while(k < max/3){
                // printf("unsetting %lu\n", j);
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
                j += 2*p;
                sieve[k / SW] |= ((ST)1 << (k % SW)); 
                k += 2*p;
            }
            if(j < max/3){
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
            }
            if(p % 1000 == 1) printf("%lu\n", p);
        } 
    } 
}

void modPrint(ST p){
    if(p % 1000 == 1) printf("%lu\n", p);
}

int main(){
    // unsigned long max = 10000000UL;
    unsigned long max = 10000000UL;
    // unsigned long max = 100UL;

    doSieve(max*log(max)*log(log(max)) + 100, &modPrint);
    // check(13);

    return 0;
}
