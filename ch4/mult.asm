// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@sum
M=0

// If R1 == 0, R2 = 0
@R1
D=M
@SET0
D;JEQ

// Sets i = R1's value
@R1
D=M
@i
M=D

(LOOP)
// sum = sum + R0
@R0
D=M
@sum
M=D+M

@i
M=M-1
D=M
@SETR2
D;JEQ

@LOOP
0;JMP

(SET0)
@R2
M=0
@END
0;JMP

(SETR2)
@sum
D=M
@R2
M=D
@END
0;JMP

// END of the program
(END)
@END
0;JMP
