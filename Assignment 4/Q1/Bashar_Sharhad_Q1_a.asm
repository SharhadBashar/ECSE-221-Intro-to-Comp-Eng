# Sharhad Bashar
# ID: 260519664 

.text 		      		# What follows are instructions

main:
	addi $t0, $t0, 0   	# Puts 0 into $t0, which is z
	slt $t1,$a3,$a2   	# If x > y, $t1 = 1 else $t1 = 0
	add $t0,$t0,$t1	 	# z = z + value of($t1)