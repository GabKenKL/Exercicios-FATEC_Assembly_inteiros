.data
	msg1: .asciiz "\nDigite o valor inteiro a ser pago (R$1000-R$9999): "
	msg2: .asciiz "\nDigite a quantidade de centavos do valor (0 centavos - 99 centavos): "
	msg3: .asciiz "\nDigite o valor inteiro de cada parcela(R$100-R$500): "
	msg4: .asciiz "\nDigite a quantidade de centavos da parcela (0centavos - 99 centavos): "
	msg5: .asciiz "\nO valor da ultima parcela equivale a R$ "
	msg6: .asciiz " e "
	msg7: .asciiz " centavos."
.text
main:
	#valor inteiro
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#centavos do valor
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#valor da parcela
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	beq $t2, 500, inicio
	
	#valor em centavos da parcela
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	j inicio
	
inicio:
	#subtracao centavos
	beq $t0, $t2, verificar_centavos
	blt $t0, $t2, fim
	sub $t1, $t1, $t3
	blt $t1, 0, convert_centavos
	j subtracao_inteiros
	
convert_centavos:
	add $t1, $t1, 100
	sub $t0, $t0, 1
	j subtracao_inteiros
	
subtracao_inteiros:
	sub $t0, $t0, $t2
	j inicio
	
verificar_centavos: #se o valor inteiro for 500
	bgt $t3, $t1, fim
	sub $t0, $t0, $t2
	sub $t1, $t1, $t3
	j fim

fim:
	#print
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg6
	syscall
	
	li $v0, 1
	move, $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msg7
	syscall
