.data
	msg1: .asciiz "\nDigite a largura: "
	msg2: .asciiz "\nDigite a altura: "
	msg3: .asciiz "\nDigite o comprimento: "
	msg4: .asciiz "\nO volume equivale a "
	
.text
main:
	#print largura
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input largura
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#print altura
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input altura
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#print comprimento
	li $v0, 4
	la $a0, msg3
	syscall
	
	#input comprimento
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#calculo do comprimento
	mul $t3, $t0, $t1
	mul $t3, $t3, $t2
	
	#print
	li $v0, 4
	la $a0, msg4
	syscall
	
	#print volume
	li $v0, 1
	move $a0, $t3
	syscall
	
