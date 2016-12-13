#Sharhad Bashar
#260519664

.globl main
.text
## main function -- uses $v0, $a0 and $a1, $t0 as scratch, not preserved
main: 
	ori 	$v0, $0, 4
	la	$a0, prompt
	syscall
	ori	$v0, $0, 5
	syscall
	move $t0, $v0
		
	ori 	$v0, $0, 4
	la	$a0, prompt
	syscall
	ori	$v0, $0, 5
	syscall
	move 	$a0, $t0	# first argument to gcd in $a0
	move 	$a1, $v0	# second argument to gcd in $a1
		
	jal gcd

	move 	$t0, $v0
	ori 	$v0, $0, 4
	la	$a0, outext
	syscall
	add	$a0, $0, $t0 	# print result
	ori 	$v0, $0, 1
	syscall 
	ori 	$v0, $0, 4
	la	$a0, crlf
	syscall


	ori 	$v0, $0, 10	# clean exit
	syscall 
########################################
#	gcd function
#	Arguments a and b in $a0 and $a1
#	return value in $v0
#	Scratch register: $t0 (not preserved)
########################################
	
gcd:	addi 	$sp, $sp, -12
	sw	$ra, 0($sp)	
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)

	bne 	$a1, $0, not0
	add	$v0, $0, $a0
	j	exgcd	
not0:	sltu 	$t0, $a1, $a0 # b<a?
	beq	$t0, $0, bgta
	sub	$t0, $a0, $a1
	add 	$a0, $0, $a1
	add	$a1, $t0, $0		#Error 1 fix
	jal	gcd	
	j	exgcd			#Error 2 fix
bgta:	sub 	$a1, $a1, $a0
	jal 	gcd
	j	exgcd
exgcd: 
lw	$a1, 8($sp) # restore
	lw	$a0, 4($sp)
	lw	$ra, 0($sp)
	addi $sp, $sp, 12		#Error 3 fix
	jr 	$ra
.data

prompt:	.asciiz "Enter argument:"
crlf:	.asciiz "\n"
outext:.asciiz "Result:"
