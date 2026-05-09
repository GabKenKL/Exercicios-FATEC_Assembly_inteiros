.data 
msg1: .asciiz "\nDigite o numero de camisetas pequenas: "
msg2: .asciiz "\nDigite o numero de camisetas medias: "
msg3: .asciiz "\nDigite o numero de camisetas grandes: "
msg4: .asciiz "\nO preco total sera de "
msg5: .asciiz "reais."
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

#print msg2
li $v0, 4
la $a0, msg2
syscall

#input
li $v0, 5
syscall
add $t1, $v0, 0

#print
li $v0, 4
la $a0, msg3
syscall

#input
li $v0, 5
syscall
add $t2, $v0, 0

#multiplicar
mul $t3, $t0, 10
mul $t4, $t1, 12
mul $t5, $t2, 15

#total
add $t6, $t3, $t6
add $t6, $t4, $t6
add $t6, $t5, $t6

#print
li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, msg5
syscall
