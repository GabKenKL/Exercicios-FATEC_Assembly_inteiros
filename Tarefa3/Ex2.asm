.data
	msg1: .asciiz "\nDigite o valor do registrador $t0: "
	msg2: .asciiz "\nDigite o valor do registrador $t1: "
	msg5: .asciiz "\nDepois da mudanca:"
	msg3: .asciiz "\n$t0 = "
	msg4: .asciiz "\n$t1 = "
	
.text
main:
	#print msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input msg1
	li $v0, 5
	syscall
	add $t0, $v0, 1
	
	#print msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input msg2
	li $v0, 5
	syscall
	add $t1, $v0, 1
	
	#troca
	move $t2, $t0
	move $t0, $t1
	move $t1, $t2
	
	#print resultado
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
