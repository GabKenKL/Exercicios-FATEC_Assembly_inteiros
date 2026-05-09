.data
	msg1: .asciiz "\nDigite o primeiro valor: "
	msg2: .asciiz "\nDigite o segundo valor: "
	msg3: .asciiz "\nO valor da somatoria dos impares � "
	
.text
main:
	#$t0 = menor
	#$t1 = maior

	#print valor 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input valor 1
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	
	#print valor 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input valor 2
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	
	#verificacao de maior
	blt $t1, $t0, troca
	move $t3, $t0
	j loop
	

troca:
	move $t2, $t1
	move $t1, $t0
	move $t0, $t2
	move $t3, $t0
	j loop
	
loop:
	rem $t4, $t3, 2
	beq $t4, 1, somatoria
	add $t3, $t3, 1
	bgt $t3, $t1, fim
	j loop
	
somatoria:
	add $t5, $t5, $t3
	add $t3, $t3, 1
	bgt $t3, $t1, fim
	j loop

fim:
	#print somatoria
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0 1
	move $a0, $t5
	syscall
	
	
	
