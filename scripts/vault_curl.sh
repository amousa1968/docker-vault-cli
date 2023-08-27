#!/bin/sh

Vault url and namespace environment variable
export VAULT_ADDR=http://localhost:8200/
export VAULT_TOKEN=value-of-token-or-an-authorized-token
export VAULT_NAMESPACE=daa

# # Call variable to read secrets
VAULT_BASE_URL=${VAULT_ADDR-http://localhost:8200}
VAULT_TOKEN=${VAULT_TOKEN-value-of-token-or-an-authorized-token}
VAULT_NAMESPACE=${VAULT_NAMESPACE-daa}

VAULT_BASE_URL=${VAULT_ADDR-http://localhost:8200}

if [ -z $1 ]
then
  echo please allocate vault token end export it as a VAULT_TOKEN
  exit 1
fi

if [ -z $2 ]
then
  echo please provide key name to read
  exit 1
fi

echo curl -H "X-Vault-Token: $1" -X GET $VAULT_BASE_URL/v1/$2

curl \
-H "X-Vault-Token: $1" \
-X GET \
$VAULT_BASE_URL/v1/$2