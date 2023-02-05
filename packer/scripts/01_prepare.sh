#!/usr/bin/env bash

set -o errtrace -o nounset -o pipefail -o errexit

echo "==> Setting nameserver"
mv /etc/resolv.conf /etc/resolv.conf.bk
echo 'nameserver 8.8.8.8' > /etc/resolv.conf

echo "==> Installing dependencies"
apt-get update -y
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release
