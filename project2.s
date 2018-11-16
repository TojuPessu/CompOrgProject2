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

la $t0, input_string			
lb $t1,0($t0) 	

#CHECKING IF INPUT IS EMPTY
beq $t1, 10, Empty_Error 	
beq $t1, 0 Empty_Error

addi $s0, $0, 35 
addi $t4, $0, 1 	
addi $t5, $0, 0 	
addi $t6, $0, 0

skip_spaces:
	lb $t1,0($t0)
	addi $t0, $t0, 1
	addi $t3, $t3, 1
	beq $t1, 32, skip_spaces
	beq $t1, 10, Empty_Error
	beq $t1, $0, Empty_Error
	
see_some_chars:
	lb $t1,0($t0)
	addi $t0, $t0, 1
	addi $t3, $t3, 1
	beq $t1, 10, go_back_beginning
	beq $t1, 0, go_back_beginning
	bne $t1, 32, see_some_chars
	
see_some_more_chars_or_spaces:
	lb $t1,0($t0)
	addi $t0, $t0, 1
	addi $t3, $t3, 1
	beq $t1, 10, go_back_beginning
	beq $t1, 0, go_back_beginning
	bne $t1, 32, Invalid_Base_Error
	j see_some_more_chars_or_spaces

go_back_beginning:
	sub $t0, $t0, $t3 
	la $t3, 0 			
	
go_foward:
	lb $t1,0($t0)
	addi $t0, $t0, 1
	beq $t1, 32, go_foward
addi $t0, $t0, -1
	


	
