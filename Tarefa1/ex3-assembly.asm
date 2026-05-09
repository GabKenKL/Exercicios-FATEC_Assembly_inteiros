.data
msg1: .asciiz "\nDigite o n�mero de horas trabalhadas: "
msg2: .asciiz "\nDigite o n�mero de horas extras: "
msg3: .asciiz "\nDigite o desconto: "
msg4: .asciiz "\nO sal�rio bruto � de R$ "
msg5: .asciiz "\nO sal�rio l�quido � de R$ "

.text
	#print ms1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#print ms2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#print msg3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#input
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#C�lculo do sal�rio bruto
	mul $t3, $t0, 10
	mul $t4, $t1, 15
	add $t5, $t3, $t4
	
	#C�lculo do sal�rio l�quido
	sub $t6, $t5, $t2
	
	#print msg4 e Salario bruto
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	#print msg5 e Salario l�quido
	li $v0, 4
	la $a0, msg5
	syscall	
	
	li $v0, 1
	move $a0, $t6
	syscall
