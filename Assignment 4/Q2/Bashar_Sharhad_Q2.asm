# Sharhad Bashar
# ID: 260519664 

# This is a code that calculates the factorial of a number.
# After compiling the c code, it was noticed that for integers 
# bigger that 12, the program does not return the correct value.
# Also the c code does not work for negative numbers, which contradicts the use 
# of unsigned integers. So abs function was used to function as a unsigned 
	
	
.data				#lets the program know we will be entering data
	
	msg1: .asciiz "Please enter an integer : " 
	msg2: .asciiz "\nThe factorial is : "

.text				# following lines are instructions

#--------------------------------------------------MAIN-----------------------------------------------------------
main: 
	li $v0, 4 		# System code for printing a string 
	la $a0, msg1		# load address of msg1 into $a0
	syscall			# prints string onto screen
	
	li $v0, 5		# System code for reading an integer
	syscall			# Reads the input
	abs $v0, $v0		# Stores the abs value of the entered input (unsigned input)	
	move $a0, $v0		# Move the user input in $a0
		
	jal .factorial		# Jump and link to .factorial
	
	move $a1, $v0 		# store the result in $a1
	
	li $v0, 4		# Call for printing string
	la $a0, msg2		# Print the second message
	syscall 		# Prints the string
	
	li $v0, 1		# System code for printing integers
 	move $a0, $a1	 	# Move the result from $a1 to $a0 
	syscall 		# Print the answer	
	
	li $v0, 10		# System code for exiting the program 
	syscall			# Exits the program
#------------------------------------------------------------------------------------------------------------------
.factorial: 

	bne $a0, $0, .generate 	# If the number is not 0, to to .generate
	ori $v0, $0, 1 		# Else set the answer to 1
	jr $ra 			# return the answer

.generate:
	
	addi $sp, $sp, -8 	# Make room for 2 registers on stack
	sw $ra, 4($sp) 		# Save return address on the second register of stack
	sw $a0, 0($sp) 		# save argument register on the first register of stack
	
	addi $a0, $a0, -1 	# Decrement the value
	jal .factorial 			# $v0 = fac(n-1)
		
	lw $a0, 0($sp) 		# restore $a0=n
	lw $ra, 4($sp) 		# restore $ra
	addi $sp, $sp, 8 	# multipop stack
		
	mul $v0, $v0, $a0 	# $v0 = fac(n-1) x n
	jr $ra 			# return
	
	

	



	
	