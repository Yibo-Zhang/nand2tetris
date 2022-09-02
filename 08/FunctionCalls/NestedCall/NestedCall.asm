@256
D=A
@SP
M=D
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
@Sys.init
0;JMP
(RET_ADDRESS.3)//function Sys.init 0

(Sys.init)
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
//push constant 4000

@4000
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 0

@SP
M=M-1
A=M
D=M
@THIS
M=D

//push constant 5000

@5000
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 1

@SP
M=M-1
A=M
D=M
@THAT
M=D

//call Sys.main 0

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
@Sys.main
0;JMP
(RET_ADDRESS.1)

//pop temp 1

@SP
M=M-1
A=M
D=M
@5
A=A+1
M=D

//label LOOP

(LOOP)

//goto LOOP

@LOOP
0;JMP

//function Sys.main 5

(Sys.main)
@5
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
//push constant 4001

@4001
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 0

@SP
M=M-1
A=M
D=M
@THIS
M=D

//push constant 5001

@5001
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 1

@SP
M=M-1
A=M
D=M
@THAT
M=D

//push constant 200

@200
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop local 1

@SP
M=M-1
A=M
D=M
@LCL
A=M
A=A+1
M=D

//push constant 40

@40
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop local 2

@SP
M=M-1
A=M
D=M
@LCL
A=M
A=A+1
A=A+1
M=D

//push constant 6

@6
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop local 3

@SP
M=M-1
A=M
D=M
@LCL
A=M
A=A+1
A=A+1
A=A+1
M=D

//push constant 123

@123
D=A
@SP
A=M
M=D
@SP
M=M+1

//call Sys.add12 1

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
@Sys.add12
0;JMP
(RET_ADDRESS.2)

//pop temp 0

@SP
M=M-1
A=M
D=M
@5
M=D

//push local 0

@LCL
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1

//push local 1

@LCL
A=M
A=A+1
D=M
@SP
A=M
M=D
@SP
M=M+1

//push local 2

@LCL
A=M
A=A+1
A=A+1
D=M
@SP
A=M
M=D
@SP
M=M+1

//push local 3

@LCL
A=M
A=A+1
A=A+1
A=A+1
D=M
@SP
A=M
M=D
@SP
M=M+1

//push local 4

@LCL
A=M
A=A+1
A=A+1
A=A+1
A=A+1
D=M
@SP
A=M
M=D
@SP
M=M+1

//add

@SP
M=M-1
A=M
D=M
A=A-1
M=M+D

//add

@SP
M=M-1
A=M
D=M
A=A-1
M=M+D

//add

@SP
M=M-1
A=M
D=M
A=A-1
M=M+D

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
//function Sys.add12 0

(Sys.add12)
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
//push constant 4002

@4002
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 0

@SP
M=M-1
A=M
D=M
@THIS
M=D

//push constant 5002

@5002
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 1

@SP
M=M-1
A=M
D=M
@THAT
M=D

//push argument 0

@ARG
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1

//push constant 12

@12
D=A
@SP
A=M
M=D
@SP
M=M+1

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
