.data
	msg1: .asciiz "\nDigite um valor: "
	msg2: .asciiz "\nO resultado foi de "
	
.text
main:
	#print msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Verificar se � impar ou par
	rem $t1, $t0, 2
	
	beq $t1, 0, par
	j impar
	
par:
	add $t2, $t0, 5
	j fim
	
impar:
	add $t2, $t0, 8
	j fim
	
fim:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move, $a0, $t2
	syscall
	
	
