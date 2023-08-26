#!#/bin/bash
#!/usr/bin/env bash

# Now using this child token, from your laptop/machine, you will be able to fetch the information from Vault server, using APIs.

$ curl -sH "X-Vault-Token: CHILD-TOKEN" -X GET VAULT-URL/v1/secret/SECRET | jq
{
  "request_id": "e53887a2-fe5a-2f27-2121-c716a697f0e8",
  "lease_id": "",
  "renewable": false,
  "lease_duration": 25920000,
  "data": {
    **************
    **************
  },
  "wrap_info": null,
  "warnings": null,
  "auth": null
}