# Source aliases if file exists
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Source auto node versioning if file exists
if [ -f ~/scripts/bash/auto-nvm.sh ]; then
    source ~/scripts/bash/auto-nvm.sh
    autoload_nvmrc
fi