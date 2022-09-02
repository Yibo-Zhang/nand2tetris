//function Main.fibonacci 0

(Main.fibonacci)
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

//push constant 2

@2
D=A
@SP
A=M
M=D
@SP
M=M+1

//lt

@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
M=-1
@lt_0
D;JGT
@SP
A=M-1
M=0
(lt_0)

//if-goto IF_TRUE

@SP
AM=M-1
D=M
@IF_TRUE
D;JNE

//goto IF_FALSE

@IF_FALSE
0;JMP

//label IF_TRUE

(IF_TRUE)

//push argument 0

@ARG
A=M
D=M
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
//label IF_FALSE

(IF_FALSE)

//push argument 0

@ARG
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1

//push constant 2

@2
D=A
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

//call Main.fibonacci 1

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
(RET_ADDRESS.1)

//push argument 0

@ARG
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1

//push constant 1

@1
D=A
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

//call Main.fibonacci 1

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
(RET_ADDRESS.2)

//add

@SP
M=M-1
A=M
D=M
A=A-1
M=M+D

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
