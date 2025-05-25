#!/bin/sh

defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# FISH Installation
brew install fish
FISH=$(which fish)
echo "$FISH" | sudo tee -a /etc/shells
chsh -s "$FISH"

# Install from brewdump

# install from App Store:
# - Amphetamine and Amphetamine-Enhancer
# - Encrypto
# - Notion Web Clipper
# - RunCat

ln -s /Users/adele/Desktop/Dev/.dotfiles/ghostty ~/.config/ghostty
ln -s /Users/adele/Desktop/Dev/.dotfiles/fish ~/.config/fish
ln -s /Users/adele/Desktop/Dev/.dotfiles/nvim ~/.config/nvim
ln -s /Users/adele/Desktop/Dev/.dotfiles/ncspot ~/.config/ncspot
ln -s /Users/adele/Desktop/Dev/.dotfiles/starship.toml ~/.config/starship.toml
ln -s /Users/adele/Desktop/Dev/.dotfiles/.gitconfig ~/.gitconfig
ln -s /Users/adele/Desktop/Dev/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s /Users/adele/Desktop/Dev/.dotfiles/nushell "/Users/adele/Library/Application Support/nushell"
