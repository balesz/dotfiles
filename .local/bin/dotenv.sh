#!/bin/sh

cd ~

init () {
  mkdir -p ~/.local/opt
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y install apt-utils build-essential software-properties-common git wget unzip zip
  sudo apt-get -y install xcape
}

install_ohmyzsh () {
  sudo apt-get -y install zsh
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

install_git () {
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get -y update
  sudo apt-get -y install git
  sudo apt-get -y upgrade
}

install_terminal () {
  wget -O wezterm.deb https://github.com/wez/wezterm/releases/download/20230408-112425-69ae8472/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb
  sudo apt-get -y install ./wezterm.deb
  rm wezterm.deb 
}

install_keyd () {
  mkdir -p ~/.local/src
  cd ~/.local/src
  git clone https://github.com/rvaiya/keyd
  cd keyd
  make && sudo make install
  cd ~/.local/src
  rm -rf keyd
  sudo systemctl stop keyd && sudo systemctl disable keyd
  sudo mkdir -p /etc/keyd
  sudo ln -s ~/.config/keyd/default.conf /etc/keyd/default.conf
  sudo systemctl enable keyd && sudo systemctl start keyd
  cd ~
}

install_font () {
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
  mkdir -p ~/.local/share/fonts/JetBrainsMonoNF
  unzip -d ~/.local/share/fonts/JetBrainsMonoNF JetBrainsMono.zip
  rm ~/.local/share/fonts/JetBrainsMonoNF/*Windows\ Compatible.ttf
  rm JetBrainsMono.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip 
  mkdir -p ~/.local/share/fonts/FiraCodeNF
  unzip -d ~/.local/share/fonts/FiraCodeNF FiraCode.zip
  rm ~/.local/share/fonts/FiraCodeNF/*Windows\ Compatible.ttf
  rm FiraCode.zip
  fc-cache -f -v
}

install_neovim () {
  DIR=~/.local/bin
  rm $DIR/nvim.appimage $DIR/neovide.AppImage
  wget -P $DIR https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
  wget -P $DIR https://github.com/neovide/neovide/releases/download/0.10.4/neovide.AppImage.zip
  unzip -d $DIR $DIR/neovide.AppImage.zip
  rm $DIR/neovide.AppImage.zip
  chmod +x $DIR/nvim.appimage $DIR/neovide.AppImage
  ln -s $DIR/nvim.appimage $DIR/nvim
  ln -s $DIR/neovide.AppImage $DIR/neovide
}

install_docker () {
  sudo apt-get -y remove docker docker-engine docker.io containerd runc
  sudo apt-get -y purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd
  sudo apt-get -y update
  sudo apt-get -y install ca-certificates curl gnupg lsb-release
  sudo mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get -y update
  sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

install_sublime_merge () {
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
  sudo apt-get -y install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get -y update
  sudo apt-get -y install sublime-merge
}

install_node () {
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

install_flutter () {
  sudo apt-get -y install clang cmake ninja-build libgtk-3-dev
  PATH=$PATH:~/.local/opt/flutter/bin
  rm -rf ~/.local/opt/flutter
  cd ~/.local/opt
  git clone https://github.com/flutter/flutter.git -b stable
  flutter channel stable
  flutter upgrade
}

install_go () {
  GO_VERSION=1.20.2
  rm -rf ~/.local/opt/go
  wget -P /tmp https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
  tar -C ~/.local/opt -xvzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz
  rm /tmp/go${GO_VERSION}.linux-amd64.tar.gz
}

install_apps () {
  DIR=`mktemp -d`
  if [ `uname -s` = Linux ]; then
    wget -P $DIR https://github.com/helix-editor/helix/releases/download/23.05/helix-23.05-x86_64.AppImage
    sudo mv $DIR/helix-23.05-x86_64.AppImage /usr/local/bin/hx ; sudo chmod +x /usr/local/bin/hx
    wget -P $DIR https://github.com/zellij-org/zellij/releases/download/v0.36.0/zellij-x86_64-unknown-linux-musl.tar.gz
    sudo tar -C /usr/local/bin -xvzf $DIR/zellij-x86_64-unknown-linux-musl.tar.gz
    wget -P $DIR https://github.com/sayanarijit/xplr/releases/download/v0.21.1/xplr-linux.tar.gz
    sudo tar -C /usr/local/bin -xvzf $DIR/xplr-linux.tar.gz
  elif [ `uname -s` = Darwin ]; then
    curl -LJ https://github.com/helix-editor/helix/releases/download/23.05/helix-23.05-aarch64-macos.tar.xz > $DIR/helix.tar.xz
    rm -rf ~/.local/opt/helix ; mkdir ~/.local/opt/helix
    tar -C ~/.local/opt/helix --strip-components=1 -xvzf $DIR/helix.tar.xz
    rm ~/.local/bin/hx ; ln -s ~/.local/opt/helix/hx ~/.local/bin/hx
  fi
  rm -rf $DIR
}

install_goapps () {
  PATH=$PATH:~/.local/opt/go/bin
  env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
  go install github.com/anmitsu/goful@latest
  go install github.com/jesseduffield/lazygit@latest
  go install github.com/jesseduffield/lazydocker@latest
  go install github.com/go-task/task/v3/cmd/task@latest
  go install github.com/xxxserxxx/gotop/v4/cmd/gotop@latest
  go install github.com/xo/usql@latest
  go install github.com/maaslalani/nap@main
  go install github.com/charmbracelet/gum@latest
}

install_protoc () {
  sudo wget -P /usr/local https://github.com/protocolbuffers/protobuf/releases/download/v22.3/protoc-22.3-linux-x86_64.zip
  sudo unzip -d /usr/local /usr/local/protoc-22.3-linux-x86_64.zip
  sudo rm /usr/local/readme.txt
  go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
  dart pub global activate protoc_plugin
}

install_test () {
  DIR=`mktemp -d`
  rm -rf $DIR
}

case ${1} in
  init) init;;
  install) install_$2;;
  *) echo Unknown command;;
esac
