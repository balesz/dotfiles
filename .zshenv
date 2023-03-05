export TERM=xterm-256color

if ! which google-chrome > /dev/null && which microsoft-edge > /dev/null; then
  export CHROME_EXECUTABLE=microsoft-edge
fi

export ANDROID_HOME=$HOME/.local/opt/android
export ANDROID_SDK_PATH=$HOME/.local/opt/android
export DOTNET_ROOT=$HOME/.local/opt/dotnet
export FLUTTER_ROOT=$HOME/.local/opt/flutter

export PATH=$PATH:/mnt/c/.local/bin:$HOME/.local/bin:$HOME/.local/opt/npm/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export PATH=$PATH:$HOME/.local/opt/go/bin:$HOME/go/bin
export PATH=$PATH:$FLUTTER_ROOT/bin:$HOME/.pub-cache/bin
export PATH=$PATH:$DOTNET_ROOT
export PATH=$PATH:$ANDROID_SDK_PATH/platform-tools:$ANDROID_SDK_PATH/tools:$ANDROID_SDK_PATH/cmdline-tools/latest/bin

