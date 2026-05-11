.data
	msg1: .asciiz "\nDigite o primeiro valor: "
	msg2: .asciiz "\nDigite o segundo valor: "
	msg3: .asciiz "\nMenor: "
	msg4: .asciiz "\nMaior: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#verificacao
	beq $t1, $t0, iguais
	blt $t1, $t0, segundo_menor
	
		#print maior:
	li $v0, 4
	la $a0, msg4
	syscall
	
	li v0, 1
	move $a0, $t0
	syscall
	
	#print menor:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li v0, 1
	move $a0, $t1
	syscall
	
	j fim
	
iguais:
	#print
	li $v0, 4
	la $a0, msg5
	syscall
	j fim

segundo_menor:
	#print maior:
	li $v0, 4
	la $a0, msg4
	syscall
	
	li v0, 1
	move $a0, $t0
	syscall
	
	#print menor:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li v0, 1
	move $a0, $t1
	syscall
	j fim
	
fim:
