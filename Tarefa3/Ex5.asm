.data
	msg1: .asciiz "\nDigite os coeficientes da equa��o do segundo grau: "
	msg2: .asciiz "\nA: "
	msg3: .asciiz "\nB: "
	msg4: .asciiz "\nC: "
	msg5: .asciiz "\nDUAS RAIZES REAIS."
	msg6: .asciiz "\nUMA RAIZ REAIS."
	msg7: .asciiz "\NAO EXISTE RAIZES REAIS."

.text
main:
	#print e input
	#msg
	li $v0, 4
	la $a0, msg1
	syscall
	
	#A
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#B
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#C
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#Descobrir delta
	#DELTA = B^2 - 4.a.c
	mul $t3, $t1, $t1
	mul $t4, $t0, 4
	mul $t4, $t2, $t4
	sub $t5, $t3, $t4
	
	
	#delta > 0
	bgt $t5, 0, duas
	beq $t5, 0, uma
	blt $t5, 0, nao
	
duas:
	li $v0, 4
	la $a0, msg5
	syscall
	j fim
	
uma:
	li $v0, 4
	la $a0, msg6
	syscall
	j fim
	
nao:
	li $v0, 4
	la $a0, msg7
	syscall
	j fim
	
fim:
