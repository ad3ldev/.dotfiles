#!/bin/sh

# macOS Initial System Setup Script
# This script handles system configuration and basic tool installation

echo "🚀 Starting macOS initial system setup..."

# Configure dock autohide speed
echo "⚙️  Configuring dock settings..."
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

# Install Homebrew
echo "🍺 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install and configure Fish shell
echo "🐠 Installing and configuring Fish shell..."
brew install fish
FISH=$(which fish)
echo "$FISH" | sudo tee -a /etc/shells
chsh -s "$FISH"

echo "✅ Initial setup complete!"
echo "🔄 Please restart your terminal, then run './mac-setup-step-2.fish' to continue."
