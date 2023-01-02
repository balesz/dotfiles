#!/bin/sh

cd ~

init () {
  cd ~
  mkdir -p ~/.local/opt
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y install apt-utils build-essential git software-properties-common wget unzip zip
}

install_ohmyzsh () {
  cd ~
  sudo apt-get -y install zsh
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

install_git () {
  cd ~
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get -y update
  sudo apt-get -y install git
  sudo apt-get -y upgrade
}

install_docker () {
  cd ~
  sudo apt-get -y remove docker docker-engine docker.io containerd runc
  sudo apt-get -y purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  sudo apt-get -y update
  sudo apt-get -y install ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get -y update
  sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

install_sublime_merge () {
  cd ~
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
  sudo apt-get -y install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get -y update
  sudo apt-get -y install sublime-merge
}

install_flutter () {
  PATH=$PATH:~/.local/opt/flutter/bin
  rm -rf ~/.local/opt/flutter
  cd ~/.local/opt
  git clone https://github.com/flutter/flutter.git -b stable
  flutter channel stable
  flutter upgrade
}

install_go () {
  GO_VERSION=1.19.4
  rm -rf ~/.local/opt/go
  wget -q -P /tmp https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
  tar -C ~/.local/opt -xzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz
  rm /tmp/go${GO_VERSION}.linux-amd64.tar.gz
}

install_go_apps () {
  PATH=$PATH:~/.local/opt/go/bin
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

