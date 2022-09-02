//function Sys.init 0

(Sys.init)
@0
D=A
(LOOP.ADD_LOCALS.3)
@NO_LOCALS.3
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP.ADD_LOCALS.3
D;JNE
(NO_LOCALS.3)
//push constant 6

@6
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 8

@8
D=A
@SP
A=M
M=D
@SP
M=M+1

//call Class1.set 2

@RET_ADDRESS.1
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
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.set
0;JMP
(RET_ADDRESS.1)

//pop temp 0

@SP
M=M-1
A=M
D=M
@5
M=D

//push constant 23

@23
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 15

@15
D=A
@SP
A=M
M=D
@SP
M=M+1

//call Class2.set 2

@RET_ADDRESS.2
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
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.set
0;JMP
(RET_ADDRESS.2)

//pop temp 0

@SP
M=M-1
A=M
D=M
@5
M=D

//call Class1.get 0

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
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.get
0;JMP
(RET_ADDRESS.3)

//call Class2.get 0

@RET_ADDRESS.4
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
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.get
0;JMP
(RET_ADDRESS.4)

//label WHILE

(WHILE)

//goto WHILE

@WHILE
0;JMP

