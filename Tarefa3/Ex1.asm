.data
	msg1: .asciiz "\nDigite uma quantidade em dolares: "
	msg2: .asciiz "\nO valor em reais equivale a R$ "
	
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
	
	#conversao
	mul $t1, $t0, 5
	
	#print reais
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
