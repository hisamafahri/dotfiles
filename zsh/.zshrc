export ZSH="$HOME/.oh-my-zsh"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/emodipt.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/lambda.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/the-unnamed.omp.json)"

# Theme
ZSH_THEME="fino"

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

# bun completions
[ -s "/Users/hisamafahri/.oh-my-zsh/completions/_bun" ] && source "/Users/hisamafahri/.oh-my-zsh/completions/_bun"

# Bun
export BUN_INSTALL="/Users/hisamafahri/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

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
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yr="yarn remove"
alias yd="yarn dev"
alias yb="yarn build"
alias ycl="yarn clean"
alias ycm="yarn commit"
alias ys="yarn start"
alias n="npm"
alias nd="npm run dev"
alias ndb="npm run debug"
alias e="open -a /Applications/Arc.app -n"
alias ep="open -a /Applications/Arc.app -n --args --incognito"
alias o="open"
alias x="exit"
alias v="nvim"
alias w="nvim /Users/hisamafahri/code/worklog/worklog.md"
alias mt="/Users/hisamafahri/app/typioca/execs/typioca"
alias cl="clear"
# NOTE: 'jq' and 'httpie' are required
alias pt="https https://muslimsalat.com/bandar-lampung.json\?key\=275dcf5462ba4e11412e41b2efa0e52 | jq '.items[0]'"
alias config="cd /Users/hisamafahri/.config"
# NOTE: 'lazygit is required'
alias lg="lazygit"

# Zoxide configuration
eval "$(zoxide init zsh)"

# Autocomplete Color Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
