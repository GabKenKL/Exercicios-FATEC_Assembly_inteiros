.data
msg1: .asciiz"\nDigite o valor A: "
msg2: .asciiz"\nDigite o valor B: "
msg3: .asciiz"\nO valor da variavel C: "
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

#print msg2
li $v0, 4
la $a0, msg2
syscall

#input msg2
li $v0, 5
syscall
add $t1, $v0, 0

#se igual
beq $t0, $t1, se
j senao

se:
add $t2, $t0, $t1
j fim

senao:
mul $t2, $t0, $t1

fim:
#print
li $v0, 4
la $a0, msg3
syscall

#print C
li $v0, 1
move $a0, $t2
syscall
