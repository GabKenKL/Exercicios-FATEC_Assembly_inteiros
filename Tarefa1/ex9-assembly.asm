.data
	msg1: .asciiz "\nDigite o primeiro valor: "
	msg2: .asciiz "\nDigite o segundo valor: "
	msg3: .asciiz "\nNao e possivel dividir por zero. Digite outro numero: "
	msg4: .asciiz "\nO valor da divisao e de "
	
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
	
	beq $t1, 0, repetir
	j divisao
	
repetir:
	#print msg3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#input msg3
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	bne $t1, 0, divisao
	j repetir
	
divisao:
	#dividir
	div $t2, $t0, $t1
	
	#print
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
