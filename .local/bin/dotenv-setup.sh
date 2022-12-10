#!/bin/sh

cd ~

init () {
  mkdir -p ~/.local/opt
}

install_ohmyzsh () {
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
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
  flutter) install_flutter;;
  golang) install_go;;
  apps) install_go_apps;;
  init) install_ohmyzsh
    install_flutter
    install_go
    install_go_apps
    ;;
esac

