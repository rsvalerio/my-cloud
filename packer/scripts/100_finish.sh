#!/usr/bin/env bash

set -o errtrace -o nounset -o pipefail -o errexit

echo "==> Cleaning"
apt-get clean
rm -rf /var/lib/apt/lists/*
apt autoremove -y