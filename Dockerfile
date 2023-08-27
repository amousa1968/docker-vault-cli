FROM ubuntu:20.04

ARG VAULT_VERSION=1.14.1

WORKDIR /root
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq -y && \
        apt-get install -y wget vim unzip && \
        wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
        unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
        mv vault /usr/bin && \
        rm vault_${VAULT_VERSION}_linux_amd64.zip
ENTRYPOINT ["/bin/bash"]

CMD bash

