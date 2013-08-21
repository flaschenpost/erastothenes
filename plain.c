
#include <stdlib.h>
#include <math.h>
#include <stdio.h>

#define ST unsigned long
#define SW (sizeof(ST) * 8)

int main(){
    // unsigned long long max = 2147483648ULL;
    // unsigned long max = 21474836UL;
    unsigned long max = 1UL<<29;
    ST *sieve = calloc(max / SW + 16, sizeof(ST)); 
    unsigned long i; 
    unsigned long pos = 2;
    for(i = 0; i < max ; ++i) 
    { 
        if(!(sieve[i / SW] & ((ST)1 << (i % SW)))) 
        { 
            unsigned long j; 
            for(j = (i*i/2-1); j < max ; j += i * 2 + 3) 
                sieve[j / SW] |= ((ST)1 << (j % SW)); 
        } 
    } 
    free(sieve);
    return 0;

}
#undef ERAS_FOREACH_PRIME_TO_N
