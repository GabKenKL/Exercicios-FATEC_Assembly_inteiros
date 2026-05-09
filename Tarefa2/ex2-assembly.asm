.data
	msg1: .asciiz "\nDigite o raio da circunferencia: "
	msg2: .asciiz "\nO comprimento equivale a: "

	
.text
main:
	#print raio
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input raio
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#calculo do comprimento
	mul $t1, $t0, 2
	mul $t1, $t1, 3
	
	#print comprimento
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move, $a0, $t1
	syscall
	
	
