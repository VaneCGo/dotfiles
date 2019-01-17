
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
DEFAULT_USER=`whoami`

HIST_STAMPS="mm/dd/yyyy"

plugins=(
  brew
  bundler
  zsh-autosuggestions
  git
  rails
  tmux
)

source $ZSH/oh-my-zsh.sh

# Environment variables

export RBENV_ROOT=/usr/local/var/rbenv

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# Custom aliases
alias agrep="alias | grep"
alias listdbs="psql -h localhost -c '\l'"
alias vim="nvim"
alias git="hub"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

HIST_STAMPS="mm/dd/yyyy"

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# External Aliases
source ~/.aliases

######## SERVICES #########

alias statusservices="brew services list"
alias startservices="brew services start postgresql; brew services start memcached"
alias stopservices="brew services stop postgresql; brew services stop memcached"

source /usr/local/share/zsh/site-functions/_aws

# Xcode
alias x="open -a Xcode *.xcodeproj"

# Helper functions
function renamedb() {
  psql -h localhost -c "alter database $1 rename to $2"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function restoredb() {
  rdd &&
  rdc &&
  psql -h localhost rubicon_development < "$1" &&
  rdm &&
  rdtp
}

# ZSH autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH syntax highlightning
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"
