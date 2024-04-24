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
export LANG=en_US.UTF-8

# 2. Packages and apps
# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/libpq/bin:$PATH

# lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# NOTE: this app will increase the shell startup time (~200ms).
# But, the benefits outweight its cost.
# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# 3. Aliases
source ~/.config/zsh/alias.zsh
