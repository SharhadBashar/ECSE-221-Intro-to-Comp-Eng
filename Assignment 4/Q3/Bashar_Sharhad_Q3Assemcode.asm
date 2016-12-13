# Sharhad Bashar
# ID: 260519664 

.data 
	arrayA: .word 1,2,3,4,5 	# Array A
	arrayB: .word 6,7,8,9,10	# Array B
	n: .word 5 			# Common length of arrays 
	#Expected result: 130	
	msg1: .asciiz "The common lengths of the arrays are : "
	msg2: .asciiz "\nThe result of MAC of the two arrays is : "

.text
#------------------------------------MAIN----------------------------------------------
main:
	la $s0, arrayA		# Loads the address of array A in $s0
	la $s1, arrayB		# Loads the address of array B in $s1
	lw $s2, n		# Loads the common lengths of the arrays in $s2

	li $t0, 0 		# Creates counter i for .MAC and sets it to 0
	
	jal .MAC		# Jump and Link to .MAC
	
	li $v0, 4		
	la $a0, msg1		# Prints the first message
	syscall

	li $v0, 1
	move $a0, $s2		# Prints the common length of arrays
	syscall

	li $v0, 4
	la $a0, msg2		# Prints the second message
	syscall

	li $v0, 1
	move $a0, $t7 		# Prints the result of MAC
	syscall

	li $v0, 10		# Exits the program
	syscall
#-------------------------------------------------------------------------------------
.MAC: 
	sll $t1, $t0, 2 	# Create offset -> i*4 
	add $t2, $t1, $s0 	# Add offset to the base of a
	add $t3, $t1, $s1 	# Add offset to the base of b 
	lw $t4, 0($t2)		# Loads arrayA[i] into $15
	lw $t5, 0($t3) 		# Load arrayB[i] into $16

	
	ori $s4, $0, 1		# Sets $s4 to 1, used for comparing purposes
	slt $s3, $t0, $s2	# Checks if n < i. If true, continues to .mult  
	beq $s3, $s4, .mult  	# Else returns the result to main
	jr $ra

#-------------------------------------------------------------------------------------	
.mult:
	beq $t5, $0, .exitLoop	# Branch if b[i] = 0
	ori $s5, $0, 1 		# And least sig bit and 1
	and $t6, $t5, $s5 	
	beq $t6, $0, .shift	# Jumps to .shift
	add $t7, $t7, $t4	# Adds the cumilative result
	j .shift
#-------------------------------------------------------------------------------------
.shift: 
	sll $t4, $t4, 1		# Shift x left by 1
	srl $t5, $t5, 1		# Shift y right by 1
	j .mult			# Jumps back to .mult
#-------------------------------------------------------------------------------------	
.exitLoop: 
	addi $t0, $t0, 1	# i++
	j .MAC			# Returns back to .MAC with incremented counter


