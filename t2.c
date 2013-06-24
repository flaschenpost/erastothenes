#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SL unsigned long 
#define ST unsigned long

int main(){
    ST j,k,oldk;
    int i;
    for (i=0; i<20; i++){
        ST p = 5 + 2*(i + i/2);

        j = (p*p-5)/2 - (p*p-5)/6 ;
        if(p%3 == 1){
            k = ((p+4)*p-5)/2 - (((p+4)*p-5)/2)/3;
        }
        else{
            k = ((p+2)*p-5)/2 - (((p+2)*p-5)/2)/3;
        }
        printf("%d  %lu %lu %lu %lu \n", i, p, j, k/2, oldk+p);
        oldk = k;
    }
}
