.data
	msg1: .asciiz "\nDigite o dia em que voce nasceu: "
	msg2: .asciiz "\nDigite o mes em que voce nasceu: "
	msg3: .asciiz "\nDigite o ano em que voce nasceu: "
	
	msg4: .asciiz "\nDigite o dia atual: "
	msg5: .asciiz "\nDigite o mes atual: "
	msg6: .asciiz "\nDigite o ano atual: "
	
	msg7: .asciiz "\nA idade em meses e de "

.text
main: 

	#print data/mes/ano de nascimento
	#1
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#2
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#3
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#4
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	#5
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 5
	syscall
	add $t4, $v0, 0
	
	#6
	li $v0, 4
	la $a0, msg6
	syscall
	
	li $v0, 5
	syscall
	add $t5, $v0, 0
	
	#meses no total
	mul $t6, $t2, 12
	add $t6, $t6, $t1
	
	mul $t7, $t5, 12
	add $t7, $t4, $t7
	
	sub $t7, $t7, $t6
	
	blt $t3, $t0, diminui
	j fim
	
diminui:
	sub $t7, $t7, 1
	j fim
	
fim:
	#print idade em meses
	li $v0, 4
	la $a0, msg7
	syscall
	
	li $v0, 1
	move $a0, $t7
	syscall
	
