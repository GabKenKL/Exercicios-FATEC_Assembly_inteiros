.data
	msg1: .asciiz "\nDigite um altura em centimetro: "
	msg2: .asciiz "\nA menor altura e de "
	msg3: .asciiz "\nA maior altura e de "
	msg4: .asciiz " cm"
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
	
	#contador
	add $t1, $t1, 1
	beq $t1, 15, fim
	
	#para o primeiro
	beq $t1, 1, inicial
	
	blt $t0, $t2, menor
	bgt $t0, $t3, maior
	j main
	
menor:
	move $t2, $t0
	j main

maior:
	move $t3, $t0
	j main
	
inicial:
	move $t2, $t0
	move $t3, $t0
	j main
	
fim:
	#print menor
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	#print maior
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
