export TERM=xterm-256color

if which hx > /dev/null; then
  export EDITOR=hx
elif which nvim > /dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vi
fi

export ANDROID_HOME=$HOME/.local/opt/android
export ANDROID_SDK_PATH=$HOME/.local/opt/android
if [ ! $JAVA_HOME ]; then
  export JAVA_HOME=$HOME/.local/opt/android-studio/jbr
fi
export DOTNET_ROOT=$HOME/.local/opt/dotnet
export FLUTTER_ROOT=$HOME/.local/opt/flutter
export FLUTTER_GIT_URL=https://github.com/flutter/flutter.git
export BUN_INSTALL=$HOME/.bun
export GEM_HOME=$HOME/.gem

NEWPATH=$HOME/.local/bin
NEWPATH=$NEWPATH:$HOME/.local/opt/go/bin
NEWPATH=$NEWPATH:$FLUTTER_ROOT/bin
NEWPATH=$NEWPATH:$BUN_INSTALL/bin
NEWPATH=$NEWPATH:$DOTNET_ROOT
NEWPATH=$NEWPATH:$ANDROID_SDK_PATH/cmdline-tools/latest/bin
NEWPATH=$NEWPATH:$ANDROID_SDK_PATH/platform-tools
NEWPATH=$NEWPATH:$ANDROID_SDK_PATH/tools
NEWPATH=$NEWPATH:$GEM_HOME/bin:$GEM_HOME/ruby/2.6.0/bin
NEWPATH=$NEWPATH:$HOME/go/bin
NEWPATH=$NEWPATH:$HOME/.pub-cache/bin
NEWPATH=$NEWPATH:$HOME/.local/opt/npm/bin
NEWPATH=$NEWPATH:$HOME/.local/share/nvim/mason/bin
export PATH=$PATH:$NEWPATH

if [ `uname -s` = Darwin ]; then
  export HELIX_RUNTIME=$HOME/.local/opt/helix/runtime
  export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
fi

if [ -e /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias nv="NVIM_APPNAME=nvim.balesz nvim"
alias nvchad="NVIM_APPNAME=nvim.nvchad nvim"
alias lg="lazygit -ucd ~/.config/lazygit"
