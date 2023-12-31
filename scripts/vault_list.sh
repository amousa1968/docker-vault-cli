#!/bin/sh
# Vault url and namespace environment variable
export VAULT_ADDR=https://address.of.vault.server/
export VAULT_TOKEN=value-of-token-or-an-authorized-token
export VAULT_NAMESPACE=daa

# Call variable to read secrets
VAULT_BASE_URL=${VAULT_ADDR-https://address.of.vault.server}
VAULT_TOKEN=${VAULT_TOKEN-value-of-token-or-an-authorized-token}
VAULT_NAMESPACE=${VAULT_NAMESPACE-daa}

if [ -z $1 ]
then
  echo provide path to list keys/subkeys  as the parameter
  exit 1
fi


if [ -z "$VAULT_API_FAMILY" ]; then
echo vault kv list -address=$VAULT_BASE_URL $1
vault kv list -address=$VAULT_BASE_URL $1
else
echo vault list -address=$VAULT_BASE_URL $1
vault list -address=$VAULT_BASE_URL $1
fi