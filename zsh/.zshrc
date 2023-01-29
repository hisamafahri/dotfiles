export ZSH="$HOME/.oh-my-zsh"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/emodipt.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/lambda.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/the-unnamed.omp.json)"

# Theme
ZSH_THEME="gnzh"

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
alias cat="bat"
alias c="cargo"
alias cr="cargo run"
alias cc="cargo check"
alias cw="cargo watch"
alias gob="go build ."
alias gw="git worktree"
alias gwa="git worktree add"
alias gwl="git worktree list"
alias gwd="git worktree remove"
alias gs="git status"
alias p="pnpm"
alias pa="pnpm add"
alias pad="pnpm -D add"
alias pr="pnpm remove"
alias pd="pnpm dev"
alias pb="pnpm build"
alias pcl="pnpm clean"
alias pcm="pnpm commit"
alias ps="pnpm start"
alias pt="pnpm test"
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yr="yarn remove"
alias yd="yarn dev"
alias yb="yarn build"
alias ycl="yarn clean"
alias ycm="yarn commit"
alias ys="yarn start"
alias yt="yarn test"
alias n="npm"
alias nd="npm run dev"
alias ndb="npm run debug"
alias e="open -a /Applications/Arc.app -n"
alias ep="open -a /Applications/Arc.app -n --args --incognito"
alias o="open"
alias x="exit"
alias v="nvim"
alias vim="nvim"
alias w="nvim /Users/hisamafahri/code/worklog/worklog.md"
alias mt="/Users/hisamafahri/app/typioca/execs/typioca"
alias cl="clear"
alias config="cd /Users/hisamafahri/.config"
# NOTE: 'lazygit is required'
alias lg="lazygit"

# Zoxide configuration
eval "$(zoxide init zsh)"

# Autocomplete Color Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[[ -s "/Users/hisamafahri/.gvm/scripts/gvm" ]] && source "/Users/hisamafahri/.gvm/scripts/gvm"

# pnpm
export PNPM_HOME="/Users/hisamafahri/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end