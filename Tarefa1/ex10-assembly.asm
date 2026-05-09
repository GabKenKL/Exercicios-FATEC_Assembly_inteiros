.data
	msg1: .asciiz "\nDigite o primeiro valor: "
	msg2: .asciiz "\nDigite o segundo valor: "
	msg3: .asciiz "\nO resto equivale a "
	
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
	
	#print msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input msg2
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	bgt $t0, $t1, divisao
	
	#troca de valores
	move $t2, $t0
	move $t0, $t1
	move $t1, $t2
	
	j divisao

divisao:
	div $t2, $t0, $t1
	mul $t3, $t1 $t2
	sub $t4, $t0, $t3
	
	#print
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
