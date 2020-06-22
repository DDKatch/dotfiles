# OhMyZsh config
export ZSH="/Users/mbmist/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(gitfast rbenv bundler vi-mode)
source $ZSH/oh-my-zsh.sh

# Use neovim/vim as default text editor tool
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load ZSH aliases
source "$HOME/.zsh-aliases"

# Rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
