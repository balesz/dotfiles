#!/bin/sh

cd ~

test () {
  echo Testing...
}

init () {
  if [ `uname -o` = "Android" ]; then
    init_termux
  elif [ `uname -s` = "Linux" ]; then
    init_linux
  elif [ `uname -s` = "Darwin" ]; then
    init_macos
  fi
}

init_termux () {
  pkg install \
  x11-repo tur-repo proot proot-distro \
  file which git wget curl zip unzip \
  zsh openssh okc-agents \
  pkg-config cmake ninja gtk3 mesa \
  dart golang rust android-tools openjdk-17 python python-pip
}

init_macos () {
  echo Init MacOS
}

init_linux () {
  mkdir -p ~/.local/opt
  sudo apt-get -y update
  sudo apt-get -y upgrade
  sudo apt-get -y install apt-utils build-essential software-properties-common git wget unzip zip
  sudo apt-get -y install xcape xclip xsel highlight
}

install_ohmyzsh () { 
  if [ `uname -s` = "Linux" ]; then
    sudo apt-get -y install zsh
  fi
  if which wget; then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  elif which curl; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

install_git () {
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get -y update
  sudo apt-get -y install git
  sudo apt-get -y upgrade
  git config --global core.excludesfile ~/.config/git/ignore
}

install_terminal () {
  wget -O wezterm.deb https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/wezterm-20230712-072601-f4abf8fd.Ubuntu22.04.deb
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
  curl -LJ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip > JetBrainsMono.zip
  curl -LJ https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip > FiraCode.zip 
  if [ `uname -s` = Linux ]; then
    mkdir -p ~/.local/share/fonts/JetBrainsMonoNF
    unzip -d ~/.local/share/fonts/JetBrainsMonoNF JetBrainsMono.zip
    rm ~/.local/share/fonts/JetBrainsMonoNF/*Windows\ Compatible.ttf
    rm JetBrainsMono.zip
    mkdir -p ~/.local/share/fonts/FiraCodeNF
    unzip -d ~/.local/share/fonts/FiraCodeNF FiraCode.zip
    rm ~/.local/share/fonts/FiraCodeNF/*Windows\ Compatible.ttf
    rm FiraCode.zip
    fc-cache -f -v
  fi
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
  if [ `uname -s` = Linux ]; then
    sudo apt-get -y install clang cmake ninja-build libgtk-3-dev
  fi
  PATH=$PATH:~/.local/opt/flutter/bin
  rm -rf ~/.local/opt/flutter
  cd ~/.local/opt
  git clone https://github.com/flutter/flutter.git -b stable
  flutter channel stable
  flutter upgrade
}

install_go () {
  GO_VERSION=1.22.5
  if [ `uname -o` = Android ]; then
    pkg install golang
  elif [ `uname -s` = Linux ]; then
    rm -rf ~/.local/opt/go
    mkdir -p ~/.local/opt/go
    curl -LJ https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz --output /tmp/go.tgz
    tar -C ~/.local/opt -xvzf /tmp/go.tgz
    rm /tmp/go.tgz
  elif [ `uname -s` = Darwin ]; then
    rm -rf ~/.local/opt/go
    mkdir -p ~/.local/opt/go
    curl -LJ https://go.dev/dl/go${GO_VERSION}.darwin-arm64.tar.gz --output /tmp/go.tgz
    tar -C ~/.local/opt -xvzf /tmp/go.tgz
    rm /tmp/go.tgz
  fi
  go install golang.org/x/tools/gopls@latest
}

install_dotnet () {
  curl -LJ https://dot.net/v1/dotnet-install.sh > ~/dotnet-install.sh
  chmod +x ~/dotnet-install.sh
  ~/dotnet-install.sh --install-dir ~/.local/opt/dotnet --version 8.0.202
  ~/dotnet-install.sh --install-dir ~/.local/opt/dotnet --version 7.0.407
  rm ~/dotnet-install.sh
}

install_apps () {
  DIR=`mktemp -d`
  VER_BAT=0.23.0
  VER_GIT_DELTA=0.16.5
  VER_HELIX=24.07
  VER_XPLR=0.21.8
  VER_ZELLIJ=0.40.1
  if [ `uname -o` = Android ]; then
    pkg install \
    zellij helix helix-grammars lazygit \
    lf walk jq unar poppler fd ripgrep fzf zoxide \
    bat git-delta
  elif [ `uname -s` = Linux ]; then
    ## bat
    echo "\nInstalling bat..."
    curl -LJ https://github.com/sharkdp/bat/releases/download/v${VER_BAT}/bat_${VER_BAT}_amd64.deb > $DIR/bat.deb
    sudo apt install $DIR/bat.deb
    ## delta
    echo "\nInstalling delta..."
    curl -LJ https://github.com/dandavison/delta/releases/download/${VER_GIT_DELTA}/git-delta_${VER_GIT_DELTA}_amd64.deb > $DIR/git-delta.deb
    sudo apt install $DIR/git-delta.deb
    ## helix
    echo "\nInstalling helix..."
    curl -LJ https://github.com/helix-editor/helix/releases/download/${VER_HELIX}/helix-${VER_HELIX}-x86_64-linux.tar.xz > $DIR/helix.tar.xz
    rm -rf ~/.local/opt/helix ; mkdir -p ~/.local/opt/helix
    tar -C ~/.local/opt/helix --strip-components=1 -xf $DIR/helix.tar.xz
    rm ~/.local/bin/hx ; ln -s ~/.local/opt/helix/hx ~/.local/bin/hx
    ## xplr
    echo "\nInstalling xplr..."
    curl -LJ https://github.com/sayanarijit/xplr/releases/download/v${VER_XPLR}/xplr-linux.tar.gz > $DIR/xplr.tar.gz
    tar -C ~/.local/bin -xvzf $DIR/xplr.tar.gz
    ## zellij
    echo "\nInstalling zellij..."
    curl -LJ https://github.com/zellij-org/zellij/releases/download/v${VER_ZELLIJ}/zellij-x86_64-unknown-linux-musl.tar.gz > $DIR/zellij.tar.gz
    tar -C ~/.local/bin -xvzf $DIR/zellij.tar.gz
  elif [ `uname -s` = Darwin ]; then
    ## delta
    echo "\nInstalling delta..."
    curl -LJ https://github.com/dandavison/delta/releases/download/${VER_GIT_DELTA}/delta-${VER_GIT_DELTA}-aarch64-apple-darwin.tar.gz > $DIR/delta.tar.gz
    tar -C $DIR --strip-components=1 -xvzf $DIR/delta.tar.gz
    mv $DIR/delta ~/.local/bin/
    ## helix
    echo "\nInstalling helix..."
    curl -LJ https://github.com/helix-editor/helix/releases/download/${VER_HELIX}/helix-${VER_HELIX}-aarch64-macos.tar.xz > $DIR/helix.tar.xz
    rm -rf ~/.local/opt/helix ; mkdir ~/.local/opt/helix
    tar -C ~/.local/opt/helix --strip-components=1 -xvzf $DIR/helix.tar.xz
    rm ~/.local/bin/hx ; ln -s ~/.local/opt/helix/hx ~/.local/bin/hx
    # zellij
    echo "\nInstalling zellij..."
    curl -LJ https://github.com/zellij-org/zellij/releases/download/v${VER_ZELLIJ}/zellij-aarch64-apple-darwin.tar.gz > $DIR/zellij.tar.gz
    tar -C ~/.local/bin -xvzf $DIR/zellij.tar.gz
  fi
  rm -rf $DIR
  if [ `which go` ]; then
    echo
  fi
}

install_goapps () {
  PATH=$PATH:~/.local/opt/go/bin
  go install golang.org/x/tools/gopls@latest
  go install github.com/jwilder/dockerize@master
  env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
  go install github.com/anmitsu/goful@latest
  go install github.com/jesseduffield/lazygit@latest
  go install github.com/jesseduffield/lazydocker@latest
  go install github.com/go-task/task/v3/cmd/task@latest
  go install github.com/xxxserxxx/gotop/v4/cmd/gotop@latest
  go install github.com/xo/usql@latest
  go install github.com/maaslalani/nap@main
  go install github.com/charmbracelet/gum@latest
  go install github.com/wvanlint/twf/cmd/twf@latest
  go install github.com/doronbehar/pistol/cmd/pistol@latest
  go install github.com/mathaou/termdbms@latest
}

install_protoc () {
  VER="24.2"
  DIR="$HOME/.local"
  ARCH="x86_64" && [ `uname -m` = aarch64 ] && ARCH="aarch_64"
  wget -P $DIR "https://github.com/protocolbuffers/protobuf/releases/download/v$VER/protoc-$VER-linux-$ARCH.zip"
  unzip -o -d $DIR "$DIR/protoc-$VER-linux-$ARCH.zip"
  rm -f "$DIR/readme.txt"
  go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
  go install github.com/bufbuild/buf/cmd/buf@latest
  dart pub global activate protoc_plugin
}

install_lsp () {
  sudo npm i -g yaml-language-server
  cargo install --force hx-lsp
  cargo install buffer-language-server
}

install_test () {
  DIR=`mktemp -d`
  rm -rf $DIR
}

case ${1} in
  init) init;;
  install) install_$2;;
  test) test;;
  *) echo Unknown command;;
esac
