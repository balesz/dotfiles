function nvim_env() {

  # List environments
  if [[ $# == 0 ]] || [[ $1 == -l ]]; then
    typeset environments=""
    echo "Current environment:\n\t$(basename `readlink ~/.config/nvim`)"
    for i in $(ls -d ~/.config/nvim*); do
      [ $(basename $i) != "nvim" ] && environments+=( `basename $i` )
    done
    environments=$(echo $environments | sed "s/\s/, /g")
    echo "Available environments:\n\t$environments"
    return 0
  fi

  # Reset environment
  if [[ $1 == -r ]] && [[ -d ~/.config/nvim.$2 ]]; then
    echo "Reseting environment: $2"
    rm -rf ~/.cache/nvim.$2 ~/.config/nvim.$2/plugin ~/.local/share/nvim.$2 ~/.local/state/nvim.$2
    mkdir ~/.cache/nvim.$2 ~/.local/share/nvim.$2 ~/.local/state/nvim.$2
    return
  fi

  # Delete environment
  if [[ $1 == -d ]] && [[ -d ~/.config/nvim.$2 ]]; then
    echo "Deleting environment: $2"
    rm -rf ~/.cache/nvim.$2 ~/.config/nvim.$2 ~/.local/share/nvim.$2 ~/.local/state/nvim.$2
    nvim_env nvchad
    return
  fi

  # Create environment
  if [[ $# == 1 ]]; then
    echo "Creating environment: $1"
    rm ~/.cache/nvim ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim
    
    [ ! -d ~/.cache/nvim.$1 ] && mkdir -p ~/.cache/nvim.$1
    ln -s ~/.cache/nvim.$1 ~/.cache/nvim
    
    [ ! -d ~/.config/nvim.$1 ] && mkdir -p ~/.config/nvim.$1
    ln -s ~/.config/nvim.$1 ~/.config/nvim
    
    [ ! -d ~/.local/share/nvim.$1 ] && mkdir -p ~/.local/share/nvim.$1 
    ln -s ~/.local/share/nvim.$1 ~/.local/share/nvim
    
    [ ! -d ~/.local/state/nvim.$1 ] && mkdir -p ~/.local/state/nvim.$1 
    ln -s ~/.local/state/nvim.$1 ~/.local/state/nvim
  fi
}

