#!/bin/bash

# NOTE:
# This script is still and will always be a work in progress

# System settings
# Display settings: More Space
# Dock: 
#   - left - small - autohide
#   - no animate on opening app - no show suggested app
#   - Mission control - No Automatic Rearrange desktop
# Trackpad: tap to click
# Keyboard Shortcut:
# Keyboards > Keyboard Shortucts > Mission Control (ON)
# Keyboards > Keyboard Shortucts > Spotlight (OFF)

username="hisam"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install zsh
ZSH=~/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone my dotfiles
git clone https://github.com/hisamafahri/dotfiles.git ~/.config

# Switch zsh config location
rm -r ~/.zshrc ~/.zprofile
ln -s ~/.config/zsh/.zshrc ~/.zshrc

# Install packages & apps
brew install \
1password-cli \
asdf \
atuin \
cmake \
eza \
fd \
fzf \
ghostty \
git \
jordanbaird-ice \
jq \
koekeishiya/formulae/skhd \
koekeishiya/formulae/yabai \
lazygit \
neovim \
noahgorstein/tap/jqp \
orbstack \
ripgrep \
the_silver_searcher \
tmux \
zsh-autosuggestions

brew install --cask \
1password \
brave-browser \
dbeaver-community \
gpg-suite \
logseq \
notion-calendar \
obsidian \
postman \
qblocker \
raycast \
readdle-spark \
shottr \
slack \
visual-studio-code

# hushlogin
touch ~/.hushlogin

## NOTE: commands to run

# Switch git global config
ln -s ~/.config/git/.my-gitconfig ~/.gitconfig

# asdf
ln -s ~/.config/.tool-versions ~/.tool-versions
ln -s ~/.config/.asdfrc ~/.asdfrc
# https://github.com/asdf-vm/asdf-plugins?tab=readme-ov-file
# TODO: Install necessary apps. See `~/.tool-versions`

# base visual studio settings
ln -s ~/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Neovim
brew upgrade neovim --fetch-HEAD
git config alias.conflict '!nvim $(git diff --name-only --diff-filter=U)'

# Start services
skhd --start-service
yabai --start-service

# Make key repeat rate faster
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
# Note: only applied after re-login

# Rosetta
# for QBlocker
softwareupdate --install-rosetta --agree-to-license

# SSH
cd ~/.ssh
ssh-keygen -t ed25519 -C "iam@hisamafahri.com"
# Then add `id_ed25519.pub` (the .pub) to GitHub or any platforms
ssh-add -K # To save key to Keychain

# cloudflared
# - ln -s ~/.config/cloudflare-tunnel.yml ~/.cloudflared/config.yml
# - cloudflared tunnel login
# - cloudflared tunnel token --cred-file ~/.cloudflared/<tunnel-id>.json <tunnel-name>

# ----- OTHERS -----

# Manual Installation Apps
# - TinkerTool
# - Klack
# - UTC Time

# Firefox configs
# Ref: https://github.com/ranmaru22/firefox-vertical-tabs?tab=readme-ov-file#how-to-install
# ln -s ~/.config/firefox/userChrome.css ./userChrome.css

# wezterm
# ln -s ~/.config/wezterm/.wezterm.lua ~/.wezterm.lua

