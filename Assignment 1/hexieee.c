//Sharhad Bashar
//I.D: 260519664
//ECSE 221

#include <stdio.h>
#include <string.h>


int main(int argc, char *argv[]){
  char *input = argv[1]; //storing input in character pointer
  int counter, eCounter, minusCounter, decimalPointCounter; //declares a counter for the loops, the exponents, decimal points and minus signs in decimal
  int inputLen = strlen(input); //stores the length of the inputted string
  printf("\n"); // Prints an extra line for better view 
  printf("The String entered: %s\n",input); //prints out the string that the user input
  
  if(argc!=2){ 
    printf("Error, incorrect arguments!\n"); //checks to make sure user input only one string. If more than more, program terminates
    return 0;
  }
  
  // HEXIDECIMAL TO DECIMAL CONVERSION 
  if(*(input) =='0' &&(*(input+1) == 'x' || *(input+1) == 'X')){ //Checks to see if input is in Hexi format 
    if(strlen(input)>10){
      printf("Error, too many hexadecimal degits!\n"); //if more than 10 characters in hexi form, terminates program
      return 0;
    }
    
    for (counter = 2; counter < inputLen; counter++){ //checks to make sure that the characters after the 0 and X are numbers between 0 and 9 or letters between A (or a) and F (or f) 
  		if(!((((*(input+counter))>='0')&&((*(input+counter)<='9')))||(((*(input+counter))>='a')&&((*(input+counter)<='f')))||(('A'<=(*(input+counter)))&&((*(input+counter)<='F'))))){
  			printf("Invalid input\n");
			return 0;
  		}
  	}
  	
    printf("Input is in Hexiddecimal form\n"); //states the type of input, in this case its Hexi
    float x; //declares a float x that stores the decimal output of the conversion
    sscanf(input, "%x\n", x);
    printf("Its Decimal output is: %g\n", x); //prints the decimal equivalance of the converted Hexi input
  }
  else if(*(input) =='0' &&(*(input+1) != 'x' || *(input+1) != 'X') && (*(input+1)<'0'||*(input+1)>'9')){ //checks to make sure that user did not accidently enter a letter other than x after 0 
	printf("Invalid input\n"); //also makes sure the program runs if the characters following the 0 are all numbers
	return 0;
  } 

// DECIMAL TO HEXIDECIMAL CONVERSION
  else{
  	eCounter=0; //sets the initial number of exponents to 0
  	minusCounter=0; //sets the initital number of minuses to 0
	decimalPointCounter=0; //sets the initital number of decimal points to 0
  	
  	for (counter = 0; counter < inputLen; counter++){ //check to make sure the input is a decimal equivalance
  		if(!((((*(input+counter))>='0')&&((*(input+counter)<='9')))||(*(input+counter)=='e')||(*(input+counter)=='E')||*(input+counter)=='-'||*(input+counter)=='.')){// also checks for "-" sign or exponent sign 
  			printf("Invalid input\n");
			return 0;
  		}
  		if (*(input)=='e'||*(input+inputLen-1)=='e'||*(input)=='E'||*(input+inputLen-1)=='E'){ //Checks to make sure decimal number does not start or end with e (both upper and lower case)
  			printf("Invalid use of exponent\n");
  			return 0;
  		}
  		if (*(input+counter)=='e'||*(input+counter)=='E'){
  			eCounter=eCounter+1; //A counter for counting the number of exponents used
  		}
  		if (*(input+counter)=='.'){
		decimalPointCounter=decimalPointCounter+1;	//A counter for the number of decimal points   
		  }
  		if (*(input+counter)=='-'){
  			minusCounter=minusCounter+1; //counter for counting all the minus signs used
  		}
  	}	
	if (eCounter > 1||minusCounter > 2){ //if more than one exponent used, or more than 2 minus signs used, program terminates
		printf ("Invalid form of input\n");
		return 0;
	}  	
    	union { //defines a new data type, with more than one member for the program
    	float decimal; //declares a float 
    	int inputDec; //the input 
    	}
		numbers; 
    	sscanf(argv[1],"%g",&numbers.decimal); 
    	printf("\n");//Extra line added for better viewing
    	printf("Input is in Decimal form\n");
    	printf("Its Hexidecimal output is: 0x%08x",numbers.inputDec); //prints the hexi equivalance of the decimal input
  }
  printf("\n"); //prints another line for better viewing  
  return 0;
}

