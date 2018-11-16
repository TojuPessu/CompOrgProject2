.data
invalid_length: .asciiz "Input is too long."
invalid_base: .asciiz "Invalid base-35 number." 
invalid_empty: .asciiz "Input is empty."
input_string: .space 40000
.text

main:
#getting user_input
li $v0, 8  
la $a0, input_string
li $a1, 40000
syscall
add $t1, $0, 0 
add $t3, $0, 0 
add $t7, $0, 2




