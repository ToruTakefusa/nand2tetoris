// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
@KBD
D=M
@WHITE
D;JEQ

// write black
@SCREEN
M=-1

//sets i = 8191
@8191
D=A
@i
M=D

//sets adr = 16384
@16384
D=A
@adr
M=D

// write black to all pixel
(LOOP_BLACK)
@adr
M=M+1
D=M
A=D
M=-1
@i
M=M-1
D=M
@EXIT_BLACK
D;JEQ
@LOOP_BLACK
0;JMP

(EXIT_BLACK)
// go back initial state
@LOOP
0;JMP

(WHITE)
@SCREEN
M=0
@8191
D=A
@i
M=D
@16384
D=A
@adr
M=D

(LOOP_WHITE)
@adr
M=M+1
D=M
A=D
M=0
@i
M=M-1
D=M
@EXIT_WHITE
D;JEQ
@LOOP_WHITE
0;JMP

(EXIT_WHITE)
@LOOP
0;JMP
