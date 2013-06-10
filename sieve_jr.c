#include <stdio.h>
#include <stdlib.h>
#include "sieve5.h"

/* main loop to start TheJokers prime generator
 */
int main(){
    ST max = 10000000UL;
    // sieve(max * log(max) + max * (log(log(max)) - 0.9385));
    sieve(max);
    return 0;
}
