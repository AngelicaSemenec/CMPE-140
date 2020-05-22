# $a0 = array base address
# $a1 = n
# $s0 = n!
Main:
 addi $a0, $0, 0x100 # array base address = 0x100
 addi $a1, $0, 0 # i = 0
 addi $t0, $0, 3
 addi $t1, $0, 50 # $t1 = 50 
CreateArray_Loop:
 slt $t2, $a1, $t1 # i < 50?
 beq $t2, $0, Exit_Loop # if not then exit loop
 sll $t2, $a1, 2 # $t2 = i * 4 (byte offset)
 add $t2, $t2, $a0 # address of array[i]
 mult $a1, $t0
 mflo $t3 # $t3 = i * 3
 sw $t3, 0($t2) # save array[i]
 addi $a1, $a1, 1 # i = i + 1
 j CreateArray_Loop
Exit_Loop:
 # your code goes in here...
 # arithmetic calculation
 addi $t0, $0, 25
 sll $t0, $t0, 2
 add $t0, $t0, $a0
 lw $t1, 0($t0)
 addi $t0, $0, 30
 sll $t0, $t0, 2
 add $t0, $t0, $a0
 lw $t2, 0($t0)
 add $t0, $t1, $t2
 divu $t0, $t0, 30
 mflo $a1
 sw $a1, 0x0
 # factorial computation
 jal factorial # call procedure
 add $s0, $v0, $0 # return value
 j done
factorial:
 addi $sp, $sp, -8 # make room on the stack
 sw $a1, 4($sp) # store $a1
 sw $ra, 0($sp) # store $ra
 # your code goes in here
 slti $t0, $a1, 2	#if n <= 1
 beq $t0, $0, else	#When greater than 1, got to else
 addi $v0, $0, 1	#Return value = 1
 addi $sp, $sp, 8	#restore stack pointer
 jr $ra
 else: addi $a1, $a1, -1 #n = n - 1
 jal factorial	#Call factorial
 lw $ra, 0($sp)	#load return address
 lw $a1, 4($sp)	#load n
 addi $sp, $sp, 8	#Restore stack pointer
 mul $v0, $v0, $a1
 jr $ra
 done: sw $s0, 0x10