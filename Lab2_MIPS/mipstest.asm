# mipstest.asm
# Test the following MIPS instructions.
# add, sub, and, or, slt, addi, lw, sw, beq, j
# Assembly Description Address Machine
main: addi $2, $0, 5 		# initialize $2 = 5 4000 20020005 00
addi $3, $0, 12 		# initialize $3 = 12 2003000c
addi $7, $3, -9 		# initialize $7 = 3 2067fff7
or $4, $7, $2 			# $4 <= 3 or 5 = 7
and $5, $3, $4 		# $5 <= 12 and 7 = 4 00642824
add $5, $5, $4 		# $5 = 4 + 7 = 11 00a42820
beq $5, $7, end 		# shouldn't be taken 10a7000a
slt $4, $3, $4 			# $4 = 12 < 7 = 0 0064202a
beq $4, $0, around 		# should be taken 10800001
addi $5, $0, 0 			# shouldn't execute 20050000
around: slt $4, $7, $2 		# $4 = 3 < 5 = 1 00e2202a
add $7, $4, $5 		# $7 = 1 + 11 = 12 00853820
sub $7, $7, $2 		# $7 = 12 - 5 = 7 00e23822
sw $7, 68($3) 			# [80] = 7 ac670044
lw $2, 80($0) 			# $2 = [80] = 7 8c020050
j end 				# should be taken 08100011
addi $2, $0, 1 			# shouldn't execute 20020001
end: sw $2, 84($0) 		# write adr 84 = 7
j main 				# go back to beginning 400048 08100000