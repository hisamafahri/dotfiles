# ___ Base shell configs
# 1. Default path/variables
export ZSH=$HOME/.oh-my-zsh

# 2. Plugins
plugins=(git zsh-autosuggestions)

# 3. Oh-my-zsh script initiation
# source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/init.zsh

# 4. Shell theme
source ~/.config/zsh/theme.zsh

# ___: User configurations

# 1. General path/variables
# export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER='nvim +Man!'
export LANG=en_US.UTF-8

# 2. Packages and apps
# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/libpq/bin:$PATH
export PATH=/Users/hisam/apps/maelstrom:$PATH

# lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# JDK
. ~/.asdf/plugins/java/set-java-home.zsh
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"
export RUST_HOME=$(asdf where rust)
export PATH=$PATH:$RUST_HOME/bin

# php
export PATH="$PATH:$(composer global config bin-dir --absolute 2>/dev/null || echo '')"

# NOTE: this app will increase the shell startup time (~200ms).
# But, the benefits outweight its cost.
# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# editor
export EDITOR=vim

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# 3. Aliases & Functions
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/functions.zsh

# Created by `pipx` on 2024-05-23 03:38:38
export PATH="$PATH:/Users/hisam/.local/bin"

# hledger
export LEDGER_FILE="$HOME/Documents/accounting/2024.journal"

# pnpm
export PNPM_HOME="/Users/hisam/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# nuxt
export NUXT_TELEMETRY_DISABLED=1

# zsh zsh-autosuggestions color to pink-ish color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/hisam/.opam/opam-init/init.zsh' ]] || source '/Users/hisam/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/hisam/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/hisam/Library/Application Support/Herd/bin/":$PATH
