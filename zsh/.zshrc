export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git macos zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# custom apps
export PATH=$HOME/app:$PATH

# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# g
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# react native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# aliases
alias b="cd .."
alias cr="cargo run"
alias gob="go build ."
alias p="pnpm"
alias e="open -a /Applications/Brave\ Browser.app -n"
alias ep="open -a /Applications/Brave\ Browser.app -n --args --incognito"
alias v="nvim"
alias mt="/Users/hisamafahri/app/typioca/execs/typioca"
alias cl="clear"
alias pt="http https://muslimsalat.com/bandar-lampung.json\?key\=275dcf5462ba4e11412e41b2efa0e52"
alias config="cd /Users/hisamafahri/.config"

# Zoxide configuration
eval "$(zoxide init zsh)"

# Autocomplete Color Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
