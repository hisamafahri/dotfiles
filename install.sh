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
brew install zsh-autosuggestions

# Install packages & apps
brew install git atuin fzf ripgrep fd koekeishiya/formulae/skhd koekeishiya/formulae/yabai jq noahgorstein/tap/jqp eza tmux neovim
brew install --cask raycast 1password slack firefox sublime-text logseq notion-calendar qblocker
# maybe: temurin

# Clone my dotfiles
git clone https://github.com/hisamafahri/dotfiles ~/.config

# hushlogin
touch ~/.hushlogin

# Switch zsh config location
rm -r ~/.zshrc ~/.zprofile
ln -s ~/.config/zsh/.zshrc ~/.zshrc

# Switch git global config
ln -s ~/.config/git/.my-gitconfig ~/.gitconfig

# Install Alacritty
brew install --cask alcritty

# asdf
brew install asdf
ln -s ~/.config/.tool-versions ~/.tool-versions
# https://github.com/asdf-vm/asdf-plugins?tab=readme-ov-file
# TODO: Install necessary apps. See `~/.tool-versions`

# Neovim
brew upgrade neovim --fetch-HEAD
brew install lua-language-server lazygit
git config alias.conflict '!nvim $(git diff --name-only --diff-filter=U)'

## LSP
# npm install -g
# eslint prettier bash-language-server typescript typescript-language-server
# vscode-langservers-extracted dockerfile-language-server-nodejs
# @tailwindcss/language-server

# Start services
skhd --start-service
yabai --start-service

# Make key repeat rate faster
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
# Note: only applied after re-login

# TODO: other manual things
# - Install Font
# - Setup system shortcut (move between desktops)
# - Reduce system motion animation (use TinkerTool)

## ===== OTHERS =====

# Install 'psql'
# brew install libpq && brew link --force libpq

# Golang tools
# NOTE: golang required
# brew install go-task/tap/go-task golang-migrate goose
# install the: golang.org/x/tools/gopls@latest

# Firefox configs
# Ref: https://github.com/ranmaru22/firefox-vertical-tabs?tab=readme-ov-file#how-to-install
# ln -s ~/.config/firefox/userChrome.css ./userChrome.css
