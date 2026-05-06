.data
	msg1: .asciiz "\nDigite um valor: "
	msg2: .asciiz "\nO numero deve ser menor ou igual do que 100. Digite outro numero: "
	msg3: .asciiz "\nA quantidade de numeros que estao contido em cada intevalo, respectivamente:"
	msg4: .asciiz "\nIntervalo [0-25]: "
	msg5: .asciiz "\nIntervalo [26-50]: "
	msg6: .asciiz "\nIntervalo [51-75]: "
	msg7: .asciiz "\nIntervalo [76-100]: "
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
	
	#validacao
	bgt $t0, 100, repetir
	j intervalos
	
repetir:
	#print msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input msg2
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#proxima verificacao
	bgt $t0, 100, repetir
	j intervalos
	
intervalos:
	blt $t0, 0, fim
	blt $t0, 26, intervalo1
	blt $t0, 51, intervalo2
	blt $t0, 76, intervalo3
	
	add $t4, $t4, 1
	j main
	
intervalo1:
	add $t1, $t1, 1
	j main
	
intervalo2:
	add $t2, $t2, 1
	j main
	
intervalo3:
	add $t3, $t3, 1
	j main
	
fim:
	#print msg3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#prints
	#msg4
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	#msg5
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	#msg6
	li $v0, 4
	la $a0, msg6
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	#msg7
	li $v0, 4
	la $a0, msg7
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
