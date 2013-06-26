#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long long
#define ST unsigned long long 
#define SW (sizeof(ST) * 8) 

#define DO2(JOB) JOB JOB
#define DO8(JOB) DO2(JOB) DO2(JOB) DO2(JOB) DO2(JOB) 
#define DO128(JOB) DO8(DO8(JOB)) DO8(DO8(JOB))

// SL max = 1ULL<<31;
int p;
SL max = 900LL;
SL j;
SL k;

//*
void dumpBits(ST *l, int n){
    for(int j = 0; j < n; j++){
        int i;
        for (i = 0; i < SW; ++i) {
            if(l[j] & (1UL << i)){
                printf("1");
            }
            else{
                printf("0");
            }
        }
        printf("\t %llu \n", l[j]);
    }
}
    // */
void doInit(ST *C){

    SL predef[561] = {0};

    __asm__ volatile(
            "mov r8,1\n"
            "mov r9,0\n"
            "mov r10,0\n"
            "or	QWORD PTR [rbp-4496], 42 \n"
            :
            :
            );

    printf("pd = %lu %lu\n", predef[0], predef[1]);
    return;
    register unsigned long r8 asm("r8") = 1;
    register unsigned long r9 asm("r9") = 0 ;// = 0;
    register unsigned long pos asm("r10") = 0;// = 0;
    r8 = 1;

    while(pos < 560){
        asm("rol $10, %r8");
        asm("add $10, %r9");
        printf("2pos = %lu r8 = %lu r9 = %lu\n", pos, r8,r9);
        printf("2pos = %lu r8 = %lu r9 = %lu\n", pos, r8,r9);
        while(r9 < 64){
            printf("3pos = %lu r8 = %lu r9 = %lu\n", pos, r8,r9);
            predef[pos] |= r8;
            asm("rol $10, %r8");
            asm("add $10, %r9");
        }
        r9 -= 64;
        pos++;
    }
    dumpBits(predef, 10);
    exit(0);
    return;
}


    //
    /*
    // first pattern extra

    while(k < (p+1)*SW){
        // printf("unsetting %llu %llu \n", j, k);
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
    for(pos = p; pos < 128; pos++){
        predef[pos] = predef[pos-p];
    }

    pos = p;
    while(pos <= limit/SW/2){
        int l = 0;
        DO128(C[pos++] |= predef[l++];)
        // C[pos++] |= predef[pos%p];
    }
}
    // */
void doWork(ST *C, SL j, SL k, SL limit, SL p){
    SL pos = j/SW;

    SL predef[128] = {0};

    // first pattern extra

    while(k < (p+1)*SW){
        // printf("unsetting %llu %llu \n", j, k);
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
    for(pos = p; pos < 128; pos++){
        predef[pos] = predef[pos-p];
    }

    pos = p;
    while(pos <= limit/SW/2){
        int l = 0;
        C[pos++] |= predef[pos%p];
    }
}

int main(){
    SL limit = max * log(max) + max * (log(log(max)) - 0.9385)+64;
    unsigned long long size_ST = ((limit/(2*SW)) + 16);
    size_ST += 256 - size_ST%256;
    printf("max = %llu, limit=%llu, size %llu\n", max, limit, size_ST);
    ST *C = (ST *)calloc(size_ST/16+1, sizeof(ST)*16);
    k = 0;
    doInit(C);
    exit(0);

    int prims[15] = {5,7,11,13,17,19,23,29,31,37,41,43,47,49,53};
    for(int i=0; i<5; i++){
        p = prims[i];
        j = (p*p-5)/2 - (p*p-5)/6;
        if(p%3 == 1){
            k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
        }
        else{
            k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
        }

        doWork(C, j, k, limit, p);
    }
    /*
    for(int i=0; i<limit; i++){
        printf("%5lu  %5lu  %c \n", i, 5+2*(i+i/2), (C[i/SW] & (1UL<<i%SW)) ? 'C' : ' ');
    }
    */

    printf("\n%llu %llu %llu \n", C[0], C[17], C[limit/(2*SW) - 1]);
    dumpBits(C,1);dumpBits(C+17,1);dumpBits(C+(limit/(2*SW) - 1),1);


    
    free(C);
    return 0;
}
