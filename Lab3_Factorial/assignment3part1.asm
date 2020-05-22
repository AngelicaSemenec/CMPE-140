#Variable Initiation
ori $a0, $0, 0x8000	#a = 0x8000
ori $a1, $0, 0x00A9	#b = 0x00A9
ori $s0, $0, 1974	#c = 1974
#Arithmetic computation
multu $a0, $a0	#x = a * a
mflo $s1		
sw $s1, 0x20
multu $s1, $a1	#y = x * b
mfhi $s2
mflo $s3
sw $s2, 0x24	
sw $s3, 0x28		
#y = y >> 16
sll $s2, $s2, 16	#shift high register by 32 - 16 left
srl $s3, $s3, 16	#shift low register right by 16
add $s2, $s2, $s3	#add the results
#c = (c + y / c) / 2
Math: divu $s2, $s0	#y/c
mflo $t0		#low bits contain the quotient
add $t0, $t0, $s0	#add y/c + c
srl $s0, $t0, 1		#shift right by 1 (division by 2) and store in c
beq $t2, 1, Loop
sw $s0, 0x2C		#store results in 0x2c
ori $t2, $0, 1
Loop: slti $t1, $s0, 1665	#while loop
bnez $t1, Done
j Math
Done: sll $s0, $s0, 8
sw $s0, 0x30