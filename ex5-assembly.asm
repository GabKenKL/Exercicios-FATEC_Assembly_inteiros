.data
msg1: .asciiz "\nDigite o valor do primeiro cateto: "
msg2: .asciiz "\nDigite o valor do segundo cateto: "
msg3: .asciiz "\nO valor da hipotenusa � de "
.text
main:
#print msg1
li $v0, 4
la $a0, msg1
syscall

#input cat1
li $v0, 5
syscall
add $t0, $v0, 0

#print msg2
li $v0, 4
la $a0, msg2
syscall

#input cat2
li $v0, 5
syscall
add $t1, $v0, 0

#hip**2 = cat ** 2 + cat ** 2
mul $t2, $t0, $t0
mul $t3, $t1, $t1
add $t4, $t3, $t2

#raiz
li $t5, 0
li $t6, 0

loop:
mul $t7, $t6, $t6
bgt $t7, $t4, result

move $t5, $t6
add $t6, $t6, 1
j loop

result:
#exibir hipotenusa
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t5
syscall
