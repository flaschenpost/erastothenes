
#pragma once

#include <stdlib.h>
#include <math.h>
#include <stdio.h>

#define ST unsigned long
#define SW (sizeof(ST) * 8)

void doSieve(ST n, void (*action)(ST)){
    ST *sieve = calloc(((n) / (2 * SW)) + 1, sizeof(ST)); 
    unsigned long i; 
    for(i = 0; i < ((n) - 3) / 2; ++i) 
    { 
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            unsigned long j; 
            for(j = i; j < ((n) - 3) / 2; j += i * 2 + 3) 
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
            if(action){
                unsigned long prime = i * 2 + 3; 
                action(prime);
            }
        } 
    } 
    free(sieve);
}

void  firePrime(ST p){
    if(p % 100000 == 1) printf("%lu\n", p);
}

void main(){
    // unsigned long long max = 2147483648ULL;
    // unsigned long max = 21474836UL;
    unsigned long max = 10000000UL;
    // unsigned long max = 214748364UL;
    doSieve(max*log(max)*log(log(max)), &firePrime);

}
