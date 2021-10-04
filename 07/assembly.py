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
        with open(self.output_file, 'w') as f:
            f.write('')

    def __call__(self):
        simple_list = ['add', 'sub', 'or', 'and', 'not', 'neg']
        push_pop_list = ['push', 'pop']
        eq_index = 0
        gt_index = 0
        lt_index = 0
        for i in self.codes:
            if len(i) == 1:
                if i[0] in simple_list:
                    self.Constructor(self.output_file,
                                     self.writeArithmetic(i[0]))
                    continue
                elif i[0] == 'eq':
                    self.Constructor(self.output_file, self.eq(eq_index))
                    eq_index += 1
                    continue
                elif i[0] == 'gt':
                    self.Constructor(self.output_file, self.gt(gt_index))
                    gt_index += 1
                    continue
                elif i[0] == 'lt':
                    self.Constructor(self.output_file, self.lt(lt_index))
                    lt_index += 1
                    continue

            elif len(i) == 3:
                self.Constructor(self.output_file,
                                 self.WritePushPop(i[0], i[1], i[2]))
                continue
            print('there is a missing line')

    def Constructor(self, outputfile, content):
        with open(outputfile, 'a') as f:
            f.write(content)

    def writeArithmetic(self, string):
        two_operation = {
            'add': 'M=M+D',
            'sub': 'M=M-D',
            'or': 'M=M|D',
            'and': 'M=M&D',
        }
        one_operation = {
            'not': 'M=!M',
            'neg': 'M=-M',
        }
        if string in two_operation:
            return self.two_operation(two_operation[string])
        elif string in one_operation:
            return self.one_operation(one_operation[string])

    def eq(self, index):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        output += 'A=A-1\n'
        output += 'D=M-D\n'
        output += 'M=-1\n'
        output += '@eq_'+str(index)+'\n'
        output += 'D;JEQ\n'
        output += '@SP\n'
        output += 'A=M-1\n'
        output += 'M=0\n'
        output += '(eq_'+str(index)+')\n'
        return output

    def gt(self, index):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        output += 'A=A-1\n'
        output += 'D=M-D\n'
        output += 'M=-1\n'
        output += '@gt_'+str(index)+'\n'
        output += 'D;JGT\n'
        output += '@SP\n'
        output += 'A=M-1\n'
        output += 'M=0\n'
        output += '(gt_'+str(index)+')\n'
        return output

    def lt(self, index):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        output += 'A=A-1\n'
        output += 'D=D-M\n'
        output += 'M=-1\n'
        output += '@lt_'+str(index)+'\n'
        output += 'D;JGT\n'
        output += '@SP\n'
        output += 'A=M-1\n'
        output += 'M=0\n'
        output += '(lt_'+str(index)+')\n'
        return output

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
        segment_list = {'local': 'LCL', 'argument': 'ARG',
                        'this': 'THIS', 'that': 'THAT'}
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
            segment = segment_list[segment]
            if command == 'push':
                output += self.push(segment, index)

            elif command == 'pop':
                output += self.pop(segment, index)
        elif segment == 'temp':
            temp = str(5)
            if command == 'push':
                output += self.push(temp, index)
            else:
                output += self.pop(temp, index)
            print(output)
        elif segment == 'pointer':
            if command=='push':
                output += self.push_pointer(str(index))
            else:
                output += self.pop_pointer(str(index))
        elif segment == 'static': # 16-255
            if command=='push':
                output+= self.push_static(index)
            else:
                output+=self.pop_static(index)

        return output
    def push_static(self,index):
        output = ''
        output += '@16\n'
        if int(index)!=0:
            for i in range(int(index)):
                output += 'A=A+'+str(1)+'\n'
        output += 'D=M\n'
        output += '@SP\n'
        output += 'A=M\n'
        output += 'M=D\n'
        output += '@SP\n'
        output += 'M=M+1\n' 
        return output
    def pop_static(self, index):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        output += '@16\n'
        if int(index)!=0:
            for i in range(int(index)):
                output += 'A=A+'+str(1)+'\n'
        output += 'M=D\n'
        return output   
    def push_pointer(self,index):
        output = ''
        if index == str(0):
            output += '@THIS\n'
        else:
            output += '@THAT\n'
        output += 'D=M\n'
        output += '@SP\n'
        output += 'A=M\n'
        output += 'M=D\n'
        output += '@SP\n'
        output += 'M=M+1\n' 
        return output   
    def pop_pointer(self,index):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        if index == str(0):
            output += '@THIS\n'
        else:
            output += '@THAT\n'
        output += 'M=D\n'
        return output    

    def push(self, segment, index):
        output = ''
        output += '@' + segment + '\n'
        if segment != str(5):
            output += 'A=M\n'
        if int(index)!=0:
            for i in range(int(index)):
                output += 'A=A+'+str(1)+'\n'
        output += 'D=M\n'
        output += '@SP\n'
        output += 'A=M\n'
        output += 'M=D\n'
        output += '@SP\n'
        output += 'M=M+1\n'
        return output

    def pop(self, segment, index):
        output = ''
        output += '@SP\n'
        output += 'M=M-1\n'
        output += 'A=M\n'
        output += 'D=M\n'
        output += '@' + segment + '\n'
        if segment != str(5):
            output += 'A=M\n'
        if int(index)!=0:
            for i in range(int(index)):
                output += 'A=A+'+str(1)+'\n'
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
