#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long long

#define ST unsigned long long
#define SW (sizeof(ST) * 8) 

void doSieve(SL max, void (*action)(SL)){

    ST *sieve = calloc(((max) / (2 * SW)) + 3, sizeof(ST)); 
    SL i;
    SL kStart = 0;
    for(i = 0; i < ((max) ) / 3; ++i) 
    { 
        // printf(" i = %lu, p = %lu, %lu \n", i, p, i/SW);
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            SL p = 5 + 2*(i + i/2);
            kStart += 2*p;

            if(p > max){
               break;
            }
            SL j = (p*p-5)/2 - (p*p-5)/6;
            SL k = kStart;

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
