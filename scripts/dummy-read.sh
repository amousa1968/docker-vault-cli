#!/bin/sh

# VAULT_BASE_URL=${VAULT_ADDR-http://localhost:8200}
VAULT_BASE_URL=${VAULT_ADDR-https://address.of.vault.server}
VAULT_TOKEN=${VAULT_TOKEN-value-of-token-or-an-authorized-token}
VAULT_NAMESPACE=${VAULT_NAMESPACE-daa}

if [ -z $1 ]
then
  echo provide key as a param in form  secret/project/keyname
  exit 1
fi

if [ -z "$VAULT_API_FAMILY" ]; then
echo vault kv get -address=$VAULT_BASE_URL $1
vault kv get -address=$VAULT_BASE_URL $1
else
echo vault read -address=$VAULT_BASE_URL $1
vault read -address=$VAULT_BASE_URL $1
fi