ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DEFAULT_USER=`whoami`

HIST_STAMPS="mm/dd/yyyy"

export BAT_CONFIG_PATH="~/.config/bat/config"

plugins=(
  # rails
  brew
  bundler
  elixir
  git
  kubectl
  kubetail
  tmux
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Environment variables

export RBENV_ROOT=/usr/local/var/rbenv

# export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="/usr/local/opt/openssl/bin:$PATH"

# Custom aliases
alias agrep="alias | grep"
alias listdbs="psql -h localhost -c '\l'"
alias vim="nvim"
alias git="hub"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Services Helpers
source ~/.services_startup

######## SERVICES #########

alias statusservices="brew services list"
alias startservices="brew services start postgresql; brew services start memcached"
alias stopservices="brew services stop postgresql; brew services stop memcached"

# Xcode
alias x="open -a Xcode *.xcodeproj"

# Helper functions
function renamedb() {
  psql -h localhost -c "alter database $1 rename to $2"
}

function restoredb() {
  rdd &&
  rdc &&
  psql -h localhost rubicon_development < "$1" &&
  rdm &&
  rdtp
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---- ASDF ----
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# ---------------

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"
