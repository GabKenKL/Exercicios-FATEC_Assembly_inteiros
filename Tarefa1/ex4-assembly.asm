.data
msg1: .asciiz "\nDigite o valor da base maior: "
msg2: .asciiz "\nDigite o valor da base menor: "
msg3: .asciiz "\nDigite o valor da base altura: "
msg4: .asciiz "\nA area vale: "
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

#print msg3
li $v0, 4
la $a0, msg3
syscall

#input
li $v0, 5
syscall
add $t2, $v0, 0

#area do trapezio
add $t3, $t0, $t1
mul $t4, $t3, $t2
div $t5, $t4, 2

#print ms4
li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t5
syscall
