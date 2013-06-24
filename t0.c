#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long long
#define ST unsigned long long 
#define SW (sizeof(ST) * 8) 

// SL max = 90000000ULL;
int p = 7;
SL max = 900LL;
SL j = 10;
SL k = 10;

void dumpBits(ST l){
    for (int i = 0; i < SW; ++i) {
        if(l & (1UL << i)){
            printf("1 ");
        }
        else{
            printf("0 ");
        }
    }
    printf("\t %llu \n", l);
}

int main(){
    ST *C ;
    SL limit = max * log(max) + max * (log(log(max)) - 0.9385);
    C = calloc((limit/(2*SW)) + 3, sizeof(ST));
    
    /*
    for(j =0; j<limit/3; j+=10){
        C[j / SW] |= ((ST)1 << (j % SW)); 
    }
    exit(0);
    /*
    for(int i=0; i<limit/(2*SW); i++){
        C[i] |= 193;
    }
    // */
    ST predef[40];

    SL pos = j/SW;
    unsigned short rest = j%SW;
    ST pattern = 0;
    while(pos <= limit/3/SW){
        pattern |= ((ST)1 << rest); 
        rest += 10;
        if(rest >= SW)
        {
            // printf("%12llu \n", pattern); 
            dumpBits(pattern);
            C[pos] |= pattern;
            pos++;
            rest -= SW;
            pattern=0;
        }
    }
    /*
       j = 15;
       k = 24;
       while(k < limit/3){
        C[j / SW] |= ((ST)1 << (j % SW)); 
        C[k / SW] |= ((ST)1 << (k % SW)); 
        
        j += 14;
        k += 14;
    }
    if(j < limit/3){
        C[j / SW] |= ((ST)1 << (j % SW)); 
    }
    // */
    return 0;
}
