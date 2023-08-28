# =============================================================================
# This script just outputs the arguments you've passed to it using vault list script
# arguments path to the secret/kv/secret_name


import subprocess


# If your shell script has shebang,
# you can omit shell=True argument.
print(subprocess.run(["/c/Users/amousa/Documents/GitHub/vault-1.14.1/scripts/vault_list.sh",
				"arguments"], shell=True))
