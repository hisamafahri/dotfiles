#install
# NOTE:
# This script is still a work in progress
#

# Install homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Echo to temporary PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/hisamafahri/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

# Install zsh & autosuggestions
ZSH=~/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install packages & apps
brew install git zoxide atuin exa fzf ripgrep fd koekeishiya/formulae/skhd koekeishiya/formulae/yabai jq noahgorstein/tap/jqp
brew install --cask microsoft-edge raycast 1password

# Clone my dotfiles
git clone https://github.com/hisamafahri/dotfiles ~/.config

# hushlogin
touch ~/.hushlogin

# spaceship
brew install spaceship
echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.config/zsh/.zshrc

# Switch zsh config location
rm -r ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc

# Install iTerm2
brew install --cask iterm2

# Prototools
curl -fsSL https://moonrepo.dev/install/proto.sh | bash
ln -s ~/.config/proto.toml ~/.proto/config.toml
# Install necessary apps, eg: node, rust, etc

# Neovim
brew install lua-language-server lazygit
git config alias.conflict '!nvim $(git diff --name-only --diff-filter=U)'

# Start services
skhd --start-service
yabai --start-service

# [TODO] Build NeoVim from Source (refer to https://github.com/neovim/neovim/wiki/Building-Neovim)
# brew install ninja cmake gettext curl
# cd ~ && mkdir app && cd app
# https://github.com/neovim/neovim/wiki/Building-Neovim

# Other manual things
# - Install Font
# - Setup system shortcut (move between desktops)
# - Reduce system motion animation

## ===== OTHERS =====

# Install 'psql'
brew install libpq && brew link --force libpq
