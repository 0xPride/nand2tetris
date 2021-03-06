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
  // bases on keyboard either clean or fill
  @i
  M=0
  @8191
  D=A
  @last
  M=D
  @KBD
  D=M
  @FILL
  D;JNE
  @CLEAN
  0;JMP


(FILL)
@SCREEN
D=M
@LOOP
D;JNE

(FILLING)
  @i
  D=M
  @last
  D=M-D
  @LOOP
  D;JEQ // go back to loop becaus all pixeles were colored

  @SCREEN
  D=A
  @i
  A=D+M
  M=-1
  @i
  M=M+1
  @FILLING
  0;JMP


(CLEAN)
@SCREEN
D=M
@LOOP
D;JEQ

(CLEANING)
  @i
  D=M
  @last
  D=M-D
  @LOOP
  D;JEQ // go back to loop becaus all pixeles were colored

  @SCREEN
  D=A
  @i
  A=D+M
  M=0
  @i
  M=M+1
  @CLEANING
  0;JMP
