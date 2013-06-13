#include <stdio.h>
#include <stdlib.h>
#include "sieve5.h"

/* main loop to start TheJokers prime generator
 */
int main(){
    ST max = 1000000UL;
    sieve(max);
    return 0;
}
