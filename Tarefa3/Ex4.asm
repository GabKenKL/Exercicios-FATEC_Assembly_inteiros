.data
	msg1: .asciiz "\nDigite seu salario: "
	msg2: .asciiz "\nO salario acrescido equivale a "
	
.text
main:
	#print msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input msg1
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Acrescer 25%
	mul $t1, $t0, 125
	div $t1, $t1, 100
	
	#print msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
