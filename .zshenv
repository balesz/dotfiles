export TERM=xterm-256color

if which hx > /dev/null; then
  export EDITOR=hx
elif which nvim > /dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vi
fi

if ! which google-chrome > /dev/null && which microsoft-edge > /dev/null; then
  export CHROME_EXECUTABLE=microsoft-edge
elif ! which google-chrome > /dev/null && which chromium-browser > /dev/null; then
  export CHROME_EXECUTABLE=chromium-browser
fi

export ANDROID_HOME=$HOME/.local/opt/android
export ANDROID_SDK_PATH=$HOME/.local/opt/android
if [ ! $JAVA_HOME ]; then
  export JAVA_HOME=$HOME/.local/opt/android-studio/jbr
fi
export DOTNET_ROOT=$HOME/.local/opt/dotnet
export FLUTTER_ROOT=$HOME/.local/opt/flutter
export FLUTTER_GIT_URL=http://github.com/flutter/flutter

if [[ $OSTYPE = darwin* ]]; then
  export GEM_HOME=$HOME/.gem
  export HELIX_RUNTIME=$HOME/.local/opt/helix/runtime
  export PATH=$GEM_HOME/bin:$GEM_HOME/ruby/2.6.0/bin:$PATH
  export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
fi

export PATH=/mnt/c/.local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/opt/npm/bin:$PATH
export PATH=$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=$HOME/.local/opt/go/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$FLUTTER_ROOT/bin:$PATH
export PATH=$DOTNET_ROOT:$PATH
export PATH=$ANDROID_SDK_PATH/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_SDK_PATH/platform-tools:$PATH
export PATH=$ANDROID_SDK_PATH/tools:$PATH

alias nv="NVIM_APPNAME=nvim.balesz nvim"
alias nvchad="NVIM_APPNAME=nvim.nvchad nvim"
alias lg="lazygit -ucd ~/.config/lazygit"
