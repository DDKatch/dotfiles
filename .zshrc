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
export LDFLAGS="-L'/usr/local/opt/zlib/lib'"
export CPPFLAGS="-I '/usr/local/opt/zlib/include'"
# zlib vars for pkg-config
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# attach asdf
. /usr/local/opt/asdf/asdf.sh
