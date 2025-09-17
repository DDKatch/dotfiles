# OhMyZsh config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(gitfast bundler vi-mode)
source $ZSH/oh-my-zsh.sh

# Use neovim/vim as default text editor tool
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load ZSH aliases
source "$HOME/.zsh-aliases"

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# zlib variables for compilers
export LDFLAGS="-L/usr/local/opt/openssl@3.2/lib"
export CPPFLAGS="-I '/usr/local/opt/zlib/include'"
# It is essential to change the flags with these values
#   for asdf python install
# export LDFLAG="-Wl,-rpath,$(brew --prefix openssl@1.1)/lib"
# export CONFIGURE_OPTS="-with-openssl=$(brew --prefix openssl@1.1)"

# zlib vars for pkg-config
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# attach asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# . /usr/local/opt/asdf/asdf.sh
echo $(arch)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dev/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dev/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dev/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dev/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PGHOST=127.0.0.1

function __env() {
  printf '%s\n' "${(P)1}"
}
export PATH="$(brew --prefix) postgresql@16/bin:$PATH"
export PATH="$(brew --prefix) sqlite/bin:$PATH"

. ~/.asdf/plugins/java/set-java-home.zsh

export REACT_EDITOR=nvi

source ~/.env.global

# as I remember, it is for -< uv >- python package manager
. "$HOME/.local/bin/env"

# this is for llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
