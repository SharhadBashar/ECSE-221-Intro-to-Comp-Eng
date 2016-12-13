# Sharhad Bashar
# ID: 260519664 

.text 					# Follwing lines contain instructions

main: 
	slt $t1, $a3, $a2		# If x > y, then t1 = 1, else t1 = 0.
	slt $t2, $a2, $t0		# If z > x, then t2 = 1, else t2 = 0.
	or $t0, $t1, $t2		# z = t1 or t2.