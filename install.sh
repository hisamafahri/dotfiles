#!/bin/bash

# NOTE:
# This script is still and will always be a work in progress

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Echo to temporary PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/hisamafahri/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

# Install zsh & autosuggestions
ZSH=~/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install packages & apps
brew install git zoxide atuin exa fzf ripgrep fd koekeishiya/formulae/skhd koekeishiya/formulae/yabai jq noahgorstein/tap/jqp temurin
brew install --cask raycast 1password heynote firefox

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

# Switch git global config
ln -s ~/.config/git/.my-gitconfig ~/.gitconfig

# Install iTerm2
brew install --cask iterm2

# Prototools
curl -fsSL https://moonrepo.dev/install/proto.sh | bash
# TODO: Install necessary apps, eg: node, yarn, pnpm, go, rust, etc

# Neovim
brew upgrade neovim --fetch-HEAD
brew install lua-language-server lazygit
git config alias.conflict '!nvim $(git diff --name-only --diff-filter=U)'

## LSP
# 'npm install -g'
# bash-language-server typescript typescript-language-server vscode-langservers-extracted dockerfile-language-server-nodejs @tailwindcss/language-server

# Start services
skhd --start-service
yabai --start-service

# Make key repeat rate faster
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# TODO: other manual things
# - Install Font
# - Setup system shortcut (move between desktops)
# - Reduce system motion animation

## ===== OTHERS =====

# Install 'psql'
brew install libpq && brew link --force libpq

# Golang tools
brew install go-task/tap/go-task golang-migrate goose
# NOTE: Install golang with 'proto' first
# proto install-global go golang.org/x/tools/gopls@latest

# Firefox configs
# Ref: https://github.com/ranmaru22/firefox-vertical-tabs?tab=readme-ov-file#how-to-install
# ln -s ~/.config/firefox/userChrome.css ./userChrome.css
