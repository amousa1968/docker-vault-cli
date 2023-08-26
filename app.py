# Python: subprocess and running a bash script with multiple arguments
#
# The above example provides arg1 and arg2 as parameters to the shell script test.sh

import subprocess

subprocess.Popen(args=['./test.sh', 'arg1 arg2 %s' % arg3], shell=True)

pass_arg=[]
pass_arg[0]="/home/test.sh"
pass_arg[1]="arg1"
pass_arg[2]="arg2"
pass_arg[2]="arg3"
pass_arg[2]="arg4"

subprocess.check_call(pass_arg)

import subprocess
subprocess.Popen(["path/to/file.sh", arg1, arg2, arg3])