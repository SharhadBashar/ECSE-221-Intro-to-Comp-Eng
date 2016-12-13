// Sharhad Bashar
// ID: 260519664

#include <stdio.h>
#include <stdlib.h>
 
long int mult(long int x, long int y) {
        /* implementation of a 32-bit multiplication of 2 integers;
         x and y are the two integers to be multiplied;
         this function should not use the built in “*”
         operator, but should carry out long binary multiplication
        */  
        
    int xNeg = (x < 0);
    int yNeg = (y < 0);
    int resultNeg = (xNeg != yNeg); 
    x = abs (x);
    y = abs (y);
    int result = 0;
    
    while(x){
        result += y;
        x--;
    }

    if(resultNeg){
        result = -result;
    }
    return result;
}
 
long int MAC(long int *a, long int *b, int n) {
 // implementation of the MAC function
 // a is a pointer to the first array
 // b is a pointer to the second array
 // n is their common length
 
        int store=0;
        int i;
        for (i=0; i<n; i++) {
                store= store + mult(a[i],b[i]);
        }
        return store;
}
 
int main(int argc, char* argv[]) {
       
        int n;
        n=3;
        long int a[3]= {1,2,3};  /* Change size of arrays as needed */
        long int b[3]= {1,2,3};
               
        printf("%d", MAC(a,b,n)); /* Change size of arrays as needed */
        
	return 0;
}
