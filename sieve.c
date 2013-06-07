#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h>


#define UPPER 10000000UL
// #define UPPER 214748364UL

// typedef unsigned long long number;
//number lookFor = 2147483648ULL;
//number max = 2147483648ULL*10ULL; // hopefully more then every 10th uneven number is prime
//
typedef unsigned long number;
number lookFor = UPPER;
number max = UPPER*log(UPPER)*log(log(UPPER)); // hopefully more then every 10th uneven number is prime

#define ST unsigned int

ST *isComposite;

unsigned short bitslong = CHAR_BIT*sizeof(ST);
unsigned int bitslong_mask = CHAR_BIT*sizeof(ST)-1;
unsigned short shiftright = log2(CHAR_BIT*sizeof(ST));

time_t rawtime;
struct tm * timeinfo;
char buffer[80];

// is not called during sieve, only once per sieving prime 
// and needed for reading if a number is prime
inline long getParts(number pos, number *slot, unsigned int *bit){
    *slot = pos >> shiftright;
    *bit = (unsigned int)(pos) & bitslong_mask;
}

int isPrime(number n){
    if(n == 1){
        return 0;
    }

    if(n < 4){
        return 1;
    }

    if((n%2) == 0){
        return 0;
    }

    number slot=0;
    unsigned int bit=0;
    number pos = (number)(n-3)/2;
    getParts(pos, &slot, &bit);
    // printf("? n=%lld  pos = %lld slot = %lld bit = %lu ret %d \n", n, pos, slot, bit, !(isComposite[slot] & (1<<bit)));
    return !(isComposite[slot] & (1UL<<bit));
}


// start sieving at offset (internal position) offset with width step 
int doSieve(number offset, number step){
    rawtime = time(0);
    time (&rawtime);
    timeinfo = localtime (&rawtime);

    strftime(buffer, 80, "%Y-%m-%d %H:%I:%S", timeinfo);
    unsigned int bit=0;
    number slot=0;
    getParts(offset, &slot, &bit);
    // printf("doSieve %s  %lld %lld  %lu \n", buffer, offset, step, isComposite[slot]);

    ST *loop = isComposite + slot;
    ST *lmax = loop + max/bitslong;
    
    while(loop <= lmax){
        loop += (step+bit) >> shiftright;
        bit = (step+bit) & bitslong_mask;
        // printf("doSieve  %lld %lld %d %lu \n", slot, step, bit, *loop);
        *loop |= (1UL << bit);
    } 
    return 1;
}

int sieve(){
    number spot;
    spot=1;
    number pos;
    pos = 0;
    while(spot < 1 + sqrt((float)max)){
        spot+=2;
        if(! isPrime(spot)){
            pos++;
            continue;
        }
        doSieve(pos, spot);
        pos++;
    }
}

void main(int argc, char *argv[]){
    if(argc > 1){
        char *tp = malloc(sizeof(char*));
        max = strtol(argv[1], &tp, 10);
    }
    printf("max %lld , sq %ld, malloc: %lld\n", max, (long)(1 + sqrt((float)max)), 1+max/bitslong);
    isComposite = calloc((2+max/bitslong), sizeof(unsigned long)) ;
    if(! isComposite){
        printf("no mem\n");
        exit(5);
    }
    printf("bl: %d %d %d \n", bitslong, shiftright, bitslong_mask);
    sieve();
    number i;
    number found = 0;
    for(i = 1; i<max && found < lookFor; i++){
        if(isPrime(i)){
            // found++;
            // printf(" %30lld %30lld \n", found, i);
            if(i % 1000 == 1) printf("%lu\n", i);
            /*
            if(found % 10000 == 0 ){
                printf("%30lld %30lld \n", found, i);
            }
            */
        }
        /*
        if(i % 1000 == 17){
            printf("%5lld %5lld \n", i, found);
        }
        */
    }
}
