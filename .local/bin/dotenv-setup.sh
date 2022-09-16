#!/bin/sh

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Go
mkdir -p ~/.local/opt ; rm -rf ~/.local/opt/go
wget -P /tmp https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
tar xvzf /tmp/go1.19.1.linux-amd64.tar.gz

# Install Applications
go install github.com/anmitsu/goful@latest
go install github.com/jesseduffield/lazygit@latest
go install github.com/go-task/task/v3/cmd/task@latest

