#!/bin/sh

cd ~

init () {
  mkdir -p ~/.local/opt
  sudo apt-get update
  sudo apt-get upgrade
}

install_ohmyzsh () {
  sudo apt-get install zsh
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

install_git () {
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update
  sudo apt install git
  sudo apt upgrade
}

install_docker () {
  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  sudo apt-get update
  sudo apt-get install ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

install_sublime_merge () {
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-merge
}

install_flutter () {
  rm -rf ~/.local/opt/flutter
  pushd ~/.local/opt
  git clone https://github.com/flutter/flutter.git -b stable
  popd
}

install_go () {
  GO_VERION=1.19.4
  rm -rf ~/.local/opt/go
  wget -P /tmp https://go.dev/dl/go${GO_VERION}.linux-amd64.tar.gz
  tar -C ~/.local/opt -xvzf /tmp/go${GO_VERION}.linux-amd64.tar.gz
  rm /tmp/go${GO_VERION}.linux-amd64.tar.gz
}

install_go_apps () {
  go install github.com/anmitsu/goful@latest
  go install github.com/jesseduffield/lazygit@latest
  go install github.com/jesseduffield/lazydocker@latest
  go install github.com/go-task/task/v3/cmd/task@latest
  go install github.com/xxxserxxx/gotop/v4/cmd/gotop@latest
  go install github.com/xo/usql@latest
}

init

case ${1} in
  zsh) install_ohmyzsh;;
  git) install_git;;
  docker) install_docker;;
  flutter) install_flutter;;
  golang) install_go;;
  apps) install_go_apps;;
  init) init
    install_ohmyzsh
    install_git
    install_docker
    install_sublime_merge
    install_flutter
    install_go
    install_go_apps
    ;;
esac

