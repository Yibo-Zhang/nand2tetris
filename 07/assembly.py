#!/usr/bin/python
import sys


class Pasrer:
    def __init__(self, Input_file):
        self.code = []
        self.constructor(Input_file)

    def __call__(self):
        return self.code

    def constructor(self, Input_file):
        with open(Input_file, 'rb') as f:
            while True:
                new_line = f.readline()
                if self.hasMoreCommands(new_line):
                    self.advance(new_line)
                else:
                    break

    def hasMoreCommands(self, string):
        return not (not string)

    def advance(self, new_line):
        new_line = new_line.decode("utf-8")
        new_line = new_line.strip()
        if not new_line.startswith('//') and new_line != '':
            self.code.append(new_line.split())


class CodeWriter:
    def __init__(self, codes, input_file):
        self.codes = codes
        self.input_file = input_file
        self.output_file = self.input_file.split('.')[0]+'.asm'

    def __call__(self):
        for i in self.codes:
            print(i)
            if len(i) == 1:
                self.Constructor(self.output_file, self.writeArithmetic(i[0]))
            elif len(i) == 3:
                self.Constructor(self.output_file, self.WritePushPop(i[0],i[1],i[2]))

    def Constructor(self, outputfile, content):
        with open(outputfile, 'a') as f:
            f.write(content)

    def writeArithmetic(self, string):
        two_operation = {
            'add': 'M=M+D',
            'sub': 'M=M-D',
            'or': 'M=M|D',
            'and': 'M=M&D',
            'eq':'M'
        }
        one_operation = {
            'not': 'M=!M',
            'neg': 'M=-M',
        }
        if string in two_operation:
            return self.two_operation(two_operation[string])
        elif string in one_operation:
            return self.one_operation(one_operation[string])

    def two_operation(self, string):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        output += 'A=A-1\n'
        output += string+'\n'
        return output

    def one_operation(self, string):
        output = ''
        output += '@SP\n'
        output += 'A=M-1\n'
        output += string + '\n'
        return output

    def WritePushPop(self, command, segment: str, index: int):
        output = ''
        segment_list = ['LCL', 'ARG', 'THIS', 'TAHT']

        if segment == 'constant':
            # constant only has push command
            output += '@'+str(index)+'\n'
            output += 'D=A\n'
            output += '@SP\n'
            output += 'A=M\n'
            output += 'M=D\n'
            output += '@SP\n'
            output += 'M=M+1\n'
        elif segment in segment_list:
            if command == 'push':
                output += '@' + segment + '\n'
                output += 'A=A+'+str(index)+'\n'
                output += 'D=M\n'
                output += '@SP\n'
                output += 'A=M\n'
                output += 'M=D\n'
                output += '@SP\n'
                output += 'M=M+1\n'
            elif command == 'pop':
                output += '@SP\n'
                output += 'M=M-1\n'
                output += 'A=M\n'
                output += 'D=M\n'
                output += '@' + segment + '\n'
                output += 'A=A+'+str(index)+'\n'
                output += 'M=D\n'
        return output


class main:
    def __init__(self, file_name):
        self.file_name = file_name

    def __call__(self):
        parser = Pasrer(self.file_name)
        codes = parser()
        codewriter = CodeWriter(codes, self.file_name)
        codewriter()


if __name__ == '__main__':
    file_name = sys.argv[1]
    main = main(file_name)
    main()

