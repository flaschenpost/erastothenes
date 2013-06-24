#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long long
#define ST unsigned long long 
#define SW (sizeof(ST) * 8) 

SL max = 80000000ULL;
int p;
// SL max = 900LL;
SL j;
SL k;

//*
void dumpBits(ST l){
    int i;
    for (i = 0; i < SW; ++i) {
        if(l & (1UL << i)){
            printf("1 ");
        }
        else{
            printf("0 ");
        }
    }
    printf("\t %llu \n", l);
}
// */
void doWork(ST *C, SL j, SL k, SL limit, SL p){
    SL pos = j/SW;

    SL pattern = 0;
    SL predef[22] = {0};

    // first pattern extra

    while(k < (p+1)*SW){
        C[j / SW] |= ((ST)1 << (j % SW)); 
        predef[j / SW] |= ((ST)1 << (j % SW)); 
        j += 2*p;
        C[k / SW] |= ((ST)1 << (k % SW)); 
        predef[k / SW] |= ((ST)1 << (k % SW)); 
        k += 2*p;
    }
    if(j < (p+1)*SW){
        // printf("unsetting %llu \n", j);
        C[j / SW] |= ((ST)1 << (j % SW)); 
        predef[j / SW] |= ((ST)1 << (j % SW)); 
    }

    predef[0] = predef[p];

    ST top = limit/2/SW;
    for(pos=p; pos < top; pos++){
        // printf("pos predef %llu %llu \n", pos, predef[(pos-1)%p]);
        C[pos] = predef[pos%p];
        pos++;
    }

}

int main(){
    SL limit = max * log(max) + max * (log(log(max)) - 0.9385);
    ST *C = calloc((limit/(2*SW)) + 3, sizeof(ST));
    k = 0;

    p = 5;
    j = (p*p-5)/2 - (p*p-5)/6;
    k += 2*p;

    doWork(C, j, k, limit, p);

    p = 7;
    j = (p*p-5)/2 - (p*p-5)/6;
    k += 2*p;

    doWork(C, j, k, limit, p);

    p = 11;
    j = (p*p-5)/2 - (p*p-5)/6;
    k += 2*p;

    doWork(C, j, k, limit, p);

    p = 13;
    j = (p*p-5)/2 - (p*p-5)/6;
    k += 2*p;

    doWork(C, j, k, limit, p);

    p = 17;
    j = (p*p-5)/2 - (p*p-5)/6;
    k += 2*p;

    doWork(C, j, k, limit, p);

    printf("\n%llu %llu %llu \n", C[0], C[17], C[limit/(2*SW) - 1]);
    dumpBits(C[0]);dumpBits(C[17]);dumpBits(C[limit/(2*SW) - 1]);


    
    free(C);
    return 0;
}
