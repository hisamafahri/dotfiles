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
atuin \ # shell history sync
cmake \
eza \
fd \
fzf \
ghostty \
git \
gofumpt \
golines \
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
tlrc \ # tldr replacement
tmux \
zsh-autosuggestions

brew install --cask \
1password \
brave-browser \
dbeaver-community \
gpg-suite \
notion-calendar \
obsidian \
postman \
qblocker \
raycast \
readdle-spark \
shottr \
slack \
zed

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

# claude desktop
ln -s ~/.config/claude/claude_desktop_config.json ~/Library/Application\ Support/Claude/claude_desktop_config.json

# Neovim
brew upgrade neovim --fetch-HEAD
git config alias.conflict '!nvim $(git diff --name-only --diff-filter=U)'

# Start services
skhd --start-service
yabai --start-service

# Make key repeat rate faster
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
# Note: only applied after re-login

# Rosetta
# for QBlocker
softwareupdate --install-rosetta --agree-to-license

# Change origin for ~/.config
code ~/.config/.git/config
# then change url to git@github.com:hisamafahri/dotfiles.git

# asdf
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add pnpm
asdf plugin add yarn
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add ni https://github.com/CanRau/asdf-ni.git
asdf plugin add python
asdf plugin add rust https://github.com/code-lever/asdf-rust.git
asdf plugin add rust-analyzer https://github.com/Xyven1/asdf-rust-analyzer.git
asdf plugin add air https://github.com/pdemagny/asdf-air.git

# nvim lsp
go install golang.org/x/tools/gopls@latest
brew install lua-language-server
npm install -g \
  typescript \
  typescript-language-server \
  vscode-langservers-extracted \
  @tailwindcss/language-server

# raycast
# import quicklinks

# cloudflared
# - ln -s ~/.config/cloudflare-tunnel.yml ~/.cloudflared/config.yml
# - cloudflared tunnel login
# - cloudflared tunnel token --cred-file ~/.cloudflared/<tunnel-id>.json <tunnel-name>

# ----- OTHERS -----

# Manual SSH
# cd ~/.ssh
# ssh-keygen -t ed25519 -C "iam@hisamafahri.com"
# # Then add `id_ed25519.pub` (the .pub) to GitHub or any platforms
# ssh-add -K # To save key to Keychain


# Manual Installation Apps
# - TinkerTool
# - Klack
# - UTC Time

# Firefox configs
# Ref: https://github.com/ranmaru22/firefox-vertical-tabs?tab=readme-ov-file#how-to-install
# ln -s ~/.config/firefox/userChrome.css ./userChrome.css

# wezterm
# ln -s ~/.config/wezterm/.wezterm.lua ~/.wezterm.lua
