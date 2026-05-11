.data
	msg1: .asciiz "\nDigite um valor: "
	msg2: .asciiz "\nValor invalido. deve ser um inteiro entre 100 a 999, digite outro: "
	msg3: .asciiz "\nCENTENA: "
	msg4: .asciiz "\nDEZENA: "
	msg5: .asciiz "\nUNIDADE: "
	
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
	
	#verificacao
	blt $t0, 100, invalido
	bgt $t0, 999, invalido
	
	j ditar
	
invalido:
	#print
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#verificacao
	blt $t0, 100, invalido
	bgt $t0, 999, invalido
	
	j ditar
	
ditar:
	#centena
	div $t1, $t0, 100
	rem $t2, $t0, 100
	
	#dezena
	div $t3, $t2, 10
	
	#unidade
	rem $t4, $t2, 10
	
	#print CENTENA

	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	#print DEZENA

	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	#print UNIDADE

	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
