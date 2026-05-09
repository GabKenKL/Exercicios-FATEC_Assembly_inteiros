.data
	msg1: .asciiz "\nDigite a primeira nota: "
	msg2: .asciiz "\nDigite a segunda nota: "
	msg3: .asciiz "\nDigite a terceira nota: "
	msg4: .asciiz "\nDigite a quarta nota: "
	msg5: .asciiz "\nA media equivale a: "
	msg6: .asciiz "\nAluno retido."
	msg7: .asciiz "\nAluno fara exame."
	msg8: .asciiz "\nAluno aprovado."
	
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
	
	blt $t0, 3, retido
	blt $t0, 6, exame
	
	li $v0, 4
	la $a0, msg8
	syscall
	j msgem2
	
msgem2:
	#print msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input msg2
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	blt $t1, 3, retido
	blt $t1, 6, exame
	
	li $v0, 4
	la $a0, msg8
	syscall
	j msgem3

msgem3:
	#print msg3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#input msg3
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	blt $t2, 3, retido
	blt $t2, 6, exame
	
	li $v0, 4
	la $a0, msg8
	syscall
	j msgem4
	
msgem4:
	#print msg4
	li $v0, 4
	la $a0, msg4
	syscall
	
	#input msg4
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	blt $t3, 3, retido
	blt $t3, 6, exame
	
	li $v0, 4
	la $a0, msg8
	syscall
	j fim
	
retido:
	li $v0, 4
	la $a0, msg6
	syscall
	
	#contador
	add $t5, $t5, 1
	beq $t5, 1, msgem2
	beq $t5, 2, msgem3
	beq $t5, 3, msgem4
	beq $t5, 4, fim
	
exame:
	li $v0, 4
	la $a0, msg7
	syscall

	#contador
	add $t5, $t5, 1
	beq $t5, 1, msgem2
	beq $t5, 2, msgem3
	beq $t5, 3, msgem4
	beq $t5, 3, fim
	
fim:
	#media
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	add $t4, $t4, $t3
	div $t7, $t4, 4
	
	#print media
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	
