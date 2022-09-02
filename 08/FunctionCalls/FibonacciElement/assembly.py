#!/usr/bin/python
import sys
import os


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
            self.code.append(new_line.split('//')[0].split())


class CodeWriter:
    def __init__(self, codes, input_file):
        self.codes = codes
        self.func_translator = VMFunctionTranslator()

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
            self.Constructor(self.output_file, '//'+' '.join(i)+'\n')
            if i[0] == 'function':
                self.Constructor(self.output_file,
                                 '\n'.join(self.func_translator.translate_function_definition(i[1], num_arguments=i[2])))
                self.class_name = i[1].split('.')[0]
                continue
            if i[0] == 'call':
                self.Constructor(self.output_file,
                                 '\n'.join(self.func_translator.translate_function_call(i[1], num_arguments=i[2])))
            if i[0] == 'return':
                self.Constructor(self.output_file,
                                 '\n'.join(self.func_translator.translate_return()))
                continue

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
            elif len(i) == 2:
                if i[0] == 'label':
                    self.Constructor(self.output_file, '('+i[1]+')\n')
                elif i[0] == 'goto':
                    self.Constructor(self.output_file, self.goto(i[1]))
                elif i[0] == 'if-goto':
                    self.Constructor(self.output_file, self.goto_if(i[1]))
                continue
            print('there is a missing line')
            print(i)

    def Constructor(self, outputfile, content):
        with open(outputfile, 'a') as f:
            f.write(content+'\n')

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
        elif segment == 'pointer':
            if command == 'push':
                output += self.push_pointer(str(index))
            else:
                output += self.pop_pointer(str(index))
        elif segment == 'static':  # 16-255
            class_name = 'Class'
            if command == 'push':
                output += self.push_static(self.class_name, index)
            else:
                output += self.pop_static(self.class_name, index)

        return output

    def push_static(self, class_name, index):
        output = ''
        output += '@'+class_name+'.'+str(index)+'\n'
        output += 'D=M\n'
        output += '@SP\n'
        output += 'A=M\n'
        output += 'M=D\n'
        output += '@SP\n'
        output += 'M=M+1\n'
        return output

    def pop_static(self, class_name, index):
        output = ''
        output += '@SP\n'
        output += 'AM=M-1\n'
        output += 'D=M\n'
        output += '@'+class_name+'.'+str(index)+'\n'
        output += 'M=D\n'
        return output

    def push_pointer(self, index):
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

    def pop_pointer(self, index):
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
        if int(index) != 0:
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
        if int(index) != 0:
            for i in range(int(index)):
                output += 'A=A+'+str(1)+'\n'
        output += 'M=D\n'
        return output

    def goto_if(self, label):
        return '@SP\nAM=M-1\nD=M\n@'+label+'\nD;JNE\n'

    def goto(self, label):
        return '@'+label+'\n0;JMP\n'


class VMFunctionTranslator():
    def __init__(self):
        self.func_count = 0
        self.call_count = 0

    def init_code(self):
        return [
            # set SP = 256
            '@256',
            'D=A',
            '@SP',
            'M=D',
            # call Sys.init
            *self.translate_function_call('Sys.init', 0)
        ]

    def translate_function_definition(self, function_name, num_arguments):
        self.func_count += 1

        return [
            # establish function label -> will be used to jump to spot when called
            '({})'.format(function_name),
            # push onto the stack 0 command.locals() times
            # initialize loop times
            '@' + str(num_arguments),
            # store in D
            'D=A',
            # establish loop label
            '(LOOP.ADD_LOCALS.{})'.format(self.func_count),
            # skip if D eq 0
            '@NO_LOCALS.{}'.format(self.func_count),
            'D;JEQ',
            # push 0 onto stack D times
            # load stack pointer
            '@SP',
            # get pointer address
            'A=M',
            # set to 0
            'M=0',
            # increment stack pointer
            '@SP',
            'M=M+1',
            # decrement D
            'D=D-1',
            # load loop
            '@LOOP.ADD_LOCALS.{}'.format(self.func_count),
            # jump back if not 0
            'D;JNE',
            '(NO_LOCALS.{})'.format(self.func_count)
        ]

    def translate_function_call(self, function_name, num_arguments):
        self.call_count += 1
        return [
            '@RET_ADDRESS.{}'.format(self.call_count),
            'D=A',
            '@SP',
            'A=M',
            'M=D',
            '@SP',
            'M=M+1',
            *self.push_reference('LCL'),
            *self.push_reference('ARG'),
            *self.push_reference('THIS'),
            *self.push_reference('THAT'),
            ## ARG = SP - 5 - nArgs
            '@SP',
            'D=M',
            '@{}'.format(num_arguments),
            'D=D-A',
            '@5',
            'D=D-A',
            '@ARG',
            'M=D',
            ## LCL = SP
            '@SP',
            'D=M',
            '@LCL',
            'M=D',
            # goto functionName
            '@{}'.format(function_name),
            '0;JMP',
            '(RET_ADDRESS.{})'.format(self.call_count)

        ]

    def push_reference(self, label):
        return [
            '@{}'.format(label),
            'D=M',
            '@SP',
            'A=M',
            'M=D',
            '@SP',
            'M=M+1'
        ]

    def translate_return(self):
        return [
            '@LCL',
            'D=M',
            '@R13',
            'M=D',
            '@5',
            'D=A',
            '@R13',
            'A=M-D',
            'D=M',
            '@R14',
            'M=D',
            # *ARG = pop()
            '@SP',
            'AM=M-1',
            'D=M',
            '@ARG',
            'A=M',
            'M=D',
            ##SP = ARG + 1
            '@ARG',
            'D=M+1',
            '@SP',
            'M=D',
            ## endFrame - index
            *self.restore('THAT', 1),
            *self.restore('THIS', 2),
            *self.restore('ARG', 3),
            *self.restore('LCL', 4),
            '@R14',
            'A=M',
            '0;JMP'
        ]

    def restore(self, label, index):
        return [
            '@{}'.format(index),
            'D=A',
            '@R13',
            'A=M-D',
            'D=M',
            '@{}'.format(label),
            'M=D'
        ]


class main:
    def __init__(self, filepath):
        self.filepath = filepath

    def __call__(self):
        # write asm file
        if self.filepath.endswith('vm'):
            self.translate_single_file()
        else:
            self.translate_dir()
            print('this is a dir')

    def translate_single_file(self):
        parser = Pasrer(self.filepath)
        codes = parser()
        codewriter = CodeWriter(codes, self.filepath)
        codewriter()

    def translate_dir(self):
        VMFunc_translator = VMFunctionTranslator()
        for root, dirs, files in os.walk(self.filepath):
            for name in files:
                if name.endswith('vm'):
                    path = os.path.join(root, name)
                    parser = Pasrer(path)
                    codes = parser()
                    codewriter = CodeWriter(codes, path)
                    codewriter.func_translator = VMFunc_translator
                    codewriter()

        # concatnate asm file to one

        for root, dirs, files in os.walk(self.filepath):

            if 'Sys.asm' in files:
                if root.strip().endswith('/'):
                    main_name = root.split('/')[-2]
                else:
                    main_name = root.split('/')[-1]
                print('root',root)
                main_file_path = os.path.join(root, main_name)+'.asm'
                print('main_file_path',main_file_path)
                with open(main_file_path, 'w') as f:
                    print('clean up')
                    f.write('')

                main_file = open(main_file_path, 'a+')
                # init
                main_file.write('\n'.join(VMFunc_translator.init_code()))
                # code
                for name in files:
                    if name.endswith('asm') and not name.startswith('Sys'):

                        file_path = os.path.join(root, name)
                        file = open(file_path, 'rb')
                        file_content = file.read()
                        main_file.write(file_content.decode("utf-8"))
                        file.close()
                sys_path = os.path.join(root, 'Sys.asm')
                sys_file = open(sys_path, 'rb')
                sys_file_content = sys_file.read()
                main_file.write(sys_file_content.decode("utf-8"))
                sys_file.close()
                main_file.close()


if __name__ == '__main__':
    file_name = sys.argv[1]
    if file_name == '.' or file_name == './':
        file_name = os.getcwd()
    main = main(file_name)
    main()
