#!/bin/sh
#!/usr/bin/env bash

# Access vault secret from bash script
# This mighty be a lengthy procedure but worth implementing, creating child tokens to fetch information from Vault Server.

# Execute following procedure at Vault Server from UI or Command Line:

# Create policy to restrict the access for clients.
# cat auth-policy.hcl 
# path "secret/Enter-Secret-Path/*" {
#   capabilities = ["read"]
# }
# Write the policy
# vault policy write client-access auth-policy.hcl                         
# Success! Uploaded policy: client-access 
# Create token
# vault token create -policy=client-access -period=768h                                    
                                                                                
# Key                Value                                                        
# ---                -----                                                        
# token              *********************                         
# token_accessor     *********************                         
# token_duration     768h                                                         
# token_renewable    true                                                         
# token_policies     [client-access default]  
# -----------------------------------------------
# vault policy write client-access auth-policy.hcl                         
# Success! Uploaded policy: client-access
#
#With this child token, users can only read the data but neither write or delete data as configured in auth-policy.
#
# Configure -period in hours. Token should be renewed after configured period of time. 
# Configure expiry period accordingly by considering max_lease_ttl and default_lease_ttl.
# Configure these parameters in config.hcl during Vault startup.
# max_lease_ttl = "1000h"
# default_lease_ttl = "1000h"
#
#
# Vault url and namespace environment variable
export VAULT_ADDR=https://address.of.vault.server/
export VAULT_TOKEN=value-of-token-or-an-authorized-token
export VAULT_NAMESPACE=daa

# vault kv get secret/Enter-Secret-Path/enter-secret-name | command

# Call variable to read secrets
VAULT_BASE_URL=${VAULT_ADDR-https://address.of.vault.server}
VAULT_TOKEN=${VAULT_TOKEN-value-of-token-or-an-authorized-token}
VAULT_NAMESPACE=${VAULT_NAMESPACE-daa}

if [ -z $1 ]
then
  echo provide key as a param in form  'secret/Enter-Secret-Path/enter-secret-name'
  exit 1
fi

if [ -z "$VAULT_API_FAMILY" ]; then
echo vault kv get -address=$VAULT_BASE_URL $1
vault kv get -address=$VAULT_BASE_URL $1
else
echo vault read -address=$VAULT_BASE_URL $1
vault read -address=$VAULT_BASE_URL $1
fi


# A snipet from a shell script ...
# Next we will invoke a command or another shell script

RETURN=$?

if [ $RETURN -eq 0 ];
then
  echo "The script was executed successfuly"
  exit 0
else
  echo "The script was NOT executed successfuly and returned the code $RETURN"
  exit $RETURN
fi



