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
