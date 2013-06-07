
#pragma once

#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

#define PACKAGE 64
#define FIRSTPRIMS 7
#define ST unsigned long
#define SW (sizeof(ST) * 8)

/* Print n as a binary number */
void printbitssimple(ST n) {
    ST i;
    i = 1UL<<(sizeof(n) * 8 - 1);

    while (i > 0) {
        if (n & i)
            printf("1");
        else
            printf("0");
        i >>= 1;
    }
}

void doSieve(ST n, void (*action)(ST)){
    ST *sieve = calloc(((n) / (2 * SW)) + 1 + PACKAGE, sizeof(ST)); 
    ST l;

    long i; 
    for(i = 0; i < FIRSTPRIMS; ++i) 
    { 
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            unsigned long j; 
            for(j = 3*i+3; j < FIRSTPRIMS; j += i * 2 + 3) {
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
                printf("unsetting %d\n", j);
            }
            if(action){
                unsigned long prime = i * 2 + 3; 
                action(prime);
            }
        } 
    } 

    long offset[FIRSTPRIMS] = {0};

    // package l
    for(l = 0; l< n/(2*SW*PACKAGE); l++){
        ST pack[PACKAGE+1] = {0};
        // uneven number. i
        for(i=0; i<FIRSTPRIMS; i++){
            if( (i == 0 ) || !(sieve[i / SW] & ((ST)1 << (i % SW)))) 
            {
                int p = 2*i+3;
                ST o = (i + (l%p)*(p - SW % p))%p;
                o += p;
                while(o < SW*PACKAGE){
                    pack[o/SW] |= ((ST)1 << (o%SW));
                    // printf("unsetting %d\n", o);
                    o += p;
                }
            }
        }
        memcpy(sieve+l*PACKAGE, pack, PACKAGE*sizeof(ST));
    }

    for(i = 0; i < ((n) - 3) / 2; ++i) 
    { 
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            unsigned long j; 
            for(j = i; j < ((n) - 3) / 2; j += i * 2 + 3) {
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
                // printf("unsetting %d\n", j);
            }
            if(action){
                unsigned long prime = i * 2 + 3; 
                action(prime);
            }
        } 
    } 
    free(sieve);
}

void doSievePtr(ST *sieve){
    ;
}

void  firePrime(ST p){
    if(1 || p % 100000 == 1) printf("%lu\n", p);
}

void main(){
    // unsigned long long max = 2147483648ULL;
    // unsigned long max = 21474836UL;
    // unsigned long max = 10000000UL;
    unsigned long max = 1000UL;
    // unsigned long max = 214748364UL;
    doSieve(max*log(max)*log(log(max)), &firePrime);

}
