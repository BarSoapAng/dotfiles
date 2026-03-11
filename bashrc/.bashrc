# Source aliases if file exists
if [ -f ~/.dotfiles/bashrc/.aliases ]; then
    source ~/.dotfiles/bashrc/.aliases
fi

# Source auto node versioning if file exists
if [ -f ~/.dotfiles/scripts/bash/auto-nvm.sh ]; then
    source ~/.dotfiles/scripts/bash/auto-nvm.sh
    autoload_nvmrc
fi

