.data
msg1: .asciiz "\nDigite a largura: "
msg2: .asciiz "\nDigite o comprimento: "
msg3: .asciiz "A área é de "
.text
main:

#print msg1
li $v0, 4
la $a0, msg1
syscall

#input largura
li $v0, 5
syscall
add $t0, $v0, 0

#print msg2
li $v0, 4
la $a0, msg2
syscall

#input comprimento
li $v0, 5
syscall
add $t1, $v0, 0

#efetuar area e exibir
mul $t2, $t1, $t0

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t2
syscall
