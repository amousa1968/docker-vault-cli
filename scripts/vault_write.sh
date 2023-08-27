#!/bin/sh

# Vault url and namespace environment variable
export VAULT_ADDR=http://localhost:8200/
export VAULT_TOKEN=value-of-token-or-an-authorized-token
export VAULT_NAMESPACE=daa

VAULT_BASE_URL=${VAULT_ADDR-http://localhost:8200}
VAULT_TOKEN=${VAULT_TOKEN-value-of-token-or-an-authorized-token}
VAULT_NAMESPACE=${VAULT_NAMESPACE-daa}

if [ -z $1 ]
then
  echo provide key as a param in form  secret/project/keyname
  exit 1
fi

if [ -z $2 ]
then
  echo provide value for $1
  exit 1
fi

if [ -z "$VAULT_API_FAMILY" ]; then
echo vault kv put -address=$VAULT_BASE_URL $1 value=$2
vault kv put -address=$VAULT_BASE_URL $1 value=$2
else
echo vault write -address=$VAULT_BASE_URL $1 value=$2
vault write -address=$VAULT_BASE_URL $1 value=$2
fi