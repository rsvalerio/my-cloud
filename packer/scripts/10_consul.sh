#!/usr/bin/env bash

set -o errtrace -o nounset -o pipefail -o errexit

echo "==> Installing Consul agent"

echo "==> Installing hashicorp apt gpg key and repository"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "==> Installing consul"
apt update && apt install consul -y

# tee /etc/resolv.conf <<EOF
# search ipa.corp.telnyx.com
# nameserver 10.255.0.101
# options timeout:1 attempts:1 rotate no-inet6
# EOF
