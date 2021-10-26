#!/bin/bash

curl --create-dirs -o "$HOME/.local/bin/kubectl" -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod u+x "$HOME/.local/bin/kubectl"

kubeseal_version=$(curl --silent "https://api.github.com/repos/bitnami-labs/sealed-secrets/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
curl --create-dirs -o "$HOME/.local/bin/kubeseal" -LO "https://github.com/bitnami-labs/sealed-secrets/releases/download/$kubeseal_version/kubeseal-linux-amd64"
chmod u+x "$HOME/.local/bin/kubeseal"
