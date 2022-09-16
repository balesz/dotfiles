#!/bin/sh

# Install Oh My Zsh
cd ~
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Go
GO_VERION=1.19.1
mkdir -p ~/.local/opt ; rm -rf ~/.local/opt/go
wget -P /tmp https://go.dev/dl/go${GO_VERION}.linux-amd64.tar.gz
tar xvzf /tmp/go${GO_VERION}.linux-amd64.tar.gz
rm /tmp/go${GO_VERION}.linux-amd64.tar.gz

# Install Applications
go install github.com/anmitsu/goful@latest
go install github.com/jesseduffield/lazygit@latest
go install github.com/go-task/task/v3/cmd/task@latest

