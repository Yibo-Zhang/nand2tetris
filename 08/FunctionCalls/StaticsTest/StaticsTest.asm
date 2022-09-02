@256
D=A
@SP
M=D
@RET_ADDRESS.9
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
@Sys.init
0;JMP
(RET_ADDRESS.9)//function Class2.set 0

(Class2.set)
@0
D=A
(LOOP.ADD_LOCALS.4)
@NO_LOCALS.4
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP.ADD_LOCALS.4
D;JNE
(NO_LOCALS.4)
//push argument 0

@ARG
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1

//pop static 0

@SP
AM=M-1
D=M
@Class2.0
M=D

//push argument 1

@ARG
A=M
A=A+1
D=M
@SP
A=M
M=D
@SP
M=M+1

//pop static 1

@SP
AM=M-1
D=M
@Class2.1
M=D

//push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1

//return

@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
//function Class2.get 0

(Class2.get)
@0
D=A
(LOOP.ADD_LOCALS.5)
@NO_LOCALS.5
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP.ADD_LOCALS.5
D;JNE
(NO_LOCALS.5)
//push static 0

@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1

//push static 1

@Class2.1
D=M
@SP
A=M
M=D
@SP
M=M+1

//sub

@SP
M=M-1
A=M
D=M
A=A-1
M=M-D

//return

@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
//function Class1.set 0

(Class1.set)
@0
D=A
(LOOP.ADD_LOCALS.1)
@NO_LOCALS.1
D;JEQ
@SP
A=M
M=0
@SP
M=M+1
D=D-1
@LOOP.ADD_LOCALS.1
D;JNE
(NO_LOCALS.1)
//push argument 0

@ARG
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1

//pop static 0

@SP
AM=M-1
D=M
@Class1.0
M=D

//push argument 1

@ARG
A=M
A=A+1
D=M
@SP
A=M
M=D
@SP
M=M+1

//pop static 1

@SP
AM=M-1
D=M
@Class1.1
M=D

//push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1

//return

@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
//function Class1.get 0

(Class1.get)
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
//push static 0

@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1

//push static 1

@Class1.1
D=M
@SP
A=M
M=D
@SP
M=M+1

//sub

@SP
M=M-1
A=M
D=M
A=A-1
M=M-D

//return

@LCL
D=M
@R13
M=D
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
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

