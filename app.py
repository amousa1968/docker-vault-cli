# Python: subprocess and running a bash script with multiple arguments
#
# The above example provides arg1 and arg2 as parameters to the shell script vault_read.sh

import subprocess


# If your shell script has shebang,
# you can omit shell=True argument.
print(subprocess.run(["/c/Users/amousa/Documents/GitHub/vault-1.14.1/scripts/vault_read.sh",
				"arguments"], shell=True))
