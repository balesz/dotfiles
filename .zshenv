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

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/opt/go/bin
export PATH=$PATH:$FLUTTER_ROOT/bin
export PATH=$PATH:$BUN_INSTALL/bin
export PATH=$PATH:$DOTNET_ROOT
export PATH=$PATH:$ANDROID_SDK_PATH/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_PATH/platform-tools
export PATH=$PATH:$ANDROID_SDK_PATH/tools
export PATH=$PATH:$GEM_HOME/bin:$GEM_HOME/ruby/2.6.0/bin

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/.local/opt/npm/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

if [ `uname -s` = Darwin ]; then
  export HELIX_RUNTIME=$HOME/.local/opt/helix/runtime
  export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
fi

alias nv="NVIM_APPNAME=nvim.balesz nvim"
alias nvchad="NVIM_APPNAME=nvim.nvchad nvim"
alias lg="lazygit -ucd ~/.config/lazygit"
