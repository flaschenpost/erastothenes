
#pragma once

#include <stdlib.h>
#include <math.h>
#include <stdio.h>

#define ST unsigned long
#define SW (sizeof(ST) * 8)

#define ERAS_FOREACH_PRIME_TO_N(N, ACTION) \
    ST *sieve = calloc(((N) / (2 * SW)) + 1, sizeof(ST)); \
unsigned long i; \
for(i = 0; i < ((N) - 3) / 2; ++i) \
{ \
    if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) \
    { \
        unsigned long j; \
        for(j = i; j < ((N) - 3) / 2; j += i * 2 + 3) \
        sieve[j / SW] |= ((ST)1 << (j % SW)); \
        unsigned long PRIME = i * 2 + 3; \
        ACTION \
    } \
} \
free(sieve);

    unsigned
getNthPrime (unsigned long n)
{
    unsigned long primes = 1;

    ERAS_FOREACH_PRIME_TO_N
        (
         n * log(n) * log(log(n)),
         ++primes;
         if(primes == n)
         return PRIME;
        );

    return 0;
}

    unsigned long
getSumOfPrimesBelow (unsigned long n)
{
    unsigned long primesum = 2;

    ERAS_FOREACH_PRIME_TO_N
        (
         n,
         primesum += PRIME;
        );

    return primesum;
}

    void
getPrimes (unsigned int *array, unsigned char *mask, unsigned int n)
{
    unsigned int primes = 1;
    array[0] = 2;

    ERAS_FOREACH_PRIME_TO_N
        (
         n * log(n) * log(log(n)),
         array[primes] = PRIME;
         mask[PRIME] = 1;
         ++primes;
         if(primes == n)
         return;
        );
}

    void
getPrimesToN (unsigned char *mask, unsigned int n)
{
    mask[2] = 1;

    ERAS_FOREACH_PRIME_TO_N
        (
         n,
         mask[PRIME] = 1;
        );
}


void main(){
    // unsigned long long max = 2147483648ULL;
    // unsigned long max = 21474836UL;
    unsigned long max = 10000000UL;
    // unsigned long max = 214748364UL;
    ERAS_FOREACH_PRIME_TO_N(max*log(max)*log(log(max))
            , if(PRIME % 100000 == 1) printf("%lu\n", PRIME);
            )

}
#undef ERAS_FOREACH_PRIME_TO_N
