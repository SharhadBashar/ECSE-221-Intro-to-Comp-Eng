# Sharhad Bashar
# ID: 260519664 

.text					# The following lines contain instructions

main:
	ori $t1, $0, 1			# Sets the value of t1 to 1
	add $t0, $t1, $t0		# ++z
	beq $t0, $a3, .ifEqual		# Go to Label ifEqual if the values of ++z and y are equal
	bne $t0, $a3, .ifNotEqual	# Go to Label ifNotEqual if ++z and y are not equal

.ifEqual:				
	ori $a2, $0, 1			# Set the value of x to 1 if the values of ++z and y are equal

.ifNotEqual: 	
	slt $a2, $t0, $a3		# If y > ++z, then x = 1, else x = 0 