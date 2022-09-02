//function Sys.init 0

(Sys.init)
@0
D=A
(LOOP.ADD_LOCALS.2)
@NO_LOCALS.2
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP.ADD_LOCALS.2
D;JNE
(NO_LOCALS.2)
//push constant 4

@4
D=A
@SP
A=M
M=D
@SP
M=M+1

//call Main.fibonacci 1

@RET_ADDRESS.3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RET_ADDRESS.3)

//label WHILE

(WHILE)

//goto WHILE

@WHILE
0;JMP

