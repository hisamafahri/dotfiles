export ZSH="$HOME/.oh-my-zsh"

# Theme
# ZSH_THEME="apple"

# Plugins
plugins=(git macos zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# spaceship
source /opt/homebrew/opt/spaceship/spaceship.zsh

# custom apps
export PATH=$HOME/app:$PATH
export TERM=xterm-256color

# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/libpq/bin:$PATH

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# export JAVA_HOME="/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"

# react native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# aliases
alias b="cd .."
alias c="cargo"
alias cat="bat"
alias cc="cargo check"
alias cl="clear"
alias cr="cargo run"
alias cw="cargo watch"
alias f="flutter"
alias gb="/Users/hisamafahri/.config/cli/branch/script.sh"
alias gg="lazygit"
alias gl="/Users/hisamafahri/.config/cli/commit/commit.sh"
alias gob="go build ."
alias gp="echo This alias is too dangerous, no!"
alias gs="git status"
alias gw="git worktree"
alias gwa="git worktree add"
alias gwd="git worktree remove"
alias gwl="git worktree list"
alias lg="lazygit"
alias ll="exa -1 -a --color auto -F -L 1 -T --group-directories-first -s name"
alias mr="make run"
alias mt="/Users/hisamafahri/app/typioca/execs/typioca"
alias n="npm"
alias nd="npm run dev"
alias ndb="npm run debug --inspect-brk"
alias o="open"
alias p="pnpm"
alias pa="pnpm add"
alias pad="pnpm -D add"
alias pb="pnpm build"
alias pcl="pnpm clean"
alias pcm="pnpm commit"
alias pd="pnpm dev"
alias pr="pnpm remove"
alias ps="pnpm start"
alias pt="pnpm test"
alias py="python"
alias python3="python"
alias t="tmux"
alias tb="nc termbin.com 9999"
alias v="nvim"
alias venv-activate="source venv/bin/activate"
alias vim="v"
alias w="nvim /Users/hisamafahri/code/worklog/worklog.md"
alias x="exit"
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yb="yarn build"
alias ycl="yarn clean"
alias ycm="yarn commit"
alias yd="yarn dev"
alias yr="yarn remove"
alias ys="yarn start"
alias yt="yarn test"
alias z.="cd /Users/hisamafahri/.config"
alias zb="zig build"
alias zl="zellij"
alias zp="cd /Users/hisamafahri/.personal"
alias zr="zig run"

# Zoxide configuration
eval "$(zoxide init zsh)"

# Autocomplete Color Configuration
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[[ -s "/Users/hisamafahri/.gvm/scripts/gvm" ]] && source "/Users/hisamafahri/.gvm/scripts/gvm"

# pnpm
export PNPM_HOME="/Users/hisamafahri/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hisamafahri/app/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hisamafahri/app/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hisamafahri/app/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hisamafahri/app/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(atuin init zsh --disable-up-arrow)"

# proto
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"
export PATH="$PROTO_HOME/tools/node/globals/bin:$PATH"
export PATH="$PROTO_HOME/.cargo/bin:$PATH"

# terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# go
export GO_VERSION=$(go version | awk '{print $3}' | cut -c 3-)
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"
export PATH="$PROTO_HOME/tools/go/$GO_VERSION/bin:$PATH"

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
