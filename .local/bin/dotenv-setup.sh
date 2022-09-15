#!/bin/sh

# Install Go
mkdir -p ~/.local/opt ; rm -rf ~/.local/opt/go
wget -P /tmp https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
tar xvzf /tmp/go1.19.1.linux-amd64.tar.gz

# Install Go apps
go install github.com/anmitsu/goful@latest
go install github.com/jesseduffield/lazygit@latest

