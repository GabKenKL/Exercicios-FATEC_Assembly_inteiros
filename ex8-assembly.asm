.data
	msg1: .asciiz "\nDigite um valor inteiro: "
	msg2: .asciiz"\nO valor final � de "

.text
main:
	
	#print
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	blt $t0, 0, menor
	j maior
	
menor:
	mul $t1, $t0, 3
	j fim
	
maior:
	mul $t1, $t0, 2
	j fim
	
fim:
	#print
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
