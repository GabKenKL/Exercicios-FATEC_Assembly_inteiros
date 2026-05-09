.data
	msg1: .asciiz "\nDigite um valor inteiro acima de zero: "
	msg2: .asciiz "\nValor invalido. Digite outro: "
	msg3: .asciiz "\nO menor equivale a "
	msg4: .asciiz "\nO maior equivale a "
	
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
	
	blt, $t0, 0, invalido
	j verificacao

invalido:
	#print msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input msg2
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	blt, $t0, 0, invalido
	j verificacao
	
verificacao:
	beq $t1, 1, primeiro
	blt $t0, $t2, menor
	bgt $t0, $t3, maior
	
	add $t1, $t1, 1
	beq $t1, 11, fim
	
	j main
	
primeiro:
	add $t2, $t0, 0 #$t2 = menor
	add $t3, $t0, 0 #$t3 = maior
	
	add $t1, $t1, 1
	
	j main
	
menor:
	move $t2, $t0
	
	add $t1, $t1, 1
	beq $t1, 11, fim
	
	j main
	
maior:
	move $t3, $t0
	
	add $t1, $t1, 1
	beq $t1, 11, fim
	
	j main
	
	
fim:
	#print menor
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	#print maior
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
