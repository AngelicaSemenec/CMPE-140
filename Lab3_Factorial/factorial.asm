main: addi $a0, $0 , 5	       # input n = 5 to $a0
sw $a0, 0($0)		       # input n stored into mem add 0x00
addi $16, $0, 1	       # f = 1

factorial: slti $t2, $a0, 2     # is a0 < 2
bnez $t2, end
mult $a0, $16		       # f = f * n
addiu $a0, $a0, -1	       # n = n - 1
mflo $16                             # Stores product to s0
j factorial	                   # Go back to factorial

end: sw $s0, 16($0)           # Stores n! into mem add location 0x10