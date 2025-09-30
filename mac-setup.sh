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

echo "⚙️ Installing Zinit..."
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "✅ Initial setup complete!"

# macOS Development Environment Setup Script
# This script sets up development tools and dotfiles
echo "��� Starting macOS development environment setup..."

# Install from Brewfile
brew bundle

# Remind user about App Store installations
echo "🍎 Please install the following apps from the App Store:"
echo "   - Amphetamine and Amphetamine-Enhancer"
echo "   - Encrypto"
echo "   - Notion Web Clipper"
echo "   - RunCat"
echo ""

# Create symbolic links for dotfiles
echo "🔗 Creating symbolic links for dotfiles..."

dotfiles_path="/Users/adele/Personal/Dev/.dotfiles"
config_path="$HOME/.config"

# Ensure .config directory exists
mkdir -p "$config_path"

# Create symlinks
echo "   Linking ghostty config..."
ln -sf $dotfiles_path/ghostty $config_path/ghostty

echo "   Linking zsh config..."
ln -sf $dotfiles_path/.zshrc ~/.zshrc

echo "   Linking neovim config..."
ln -sf $dotfiles_path/nvim $config_path/nvim

echo "   Linking starship config..."
ln -sf $dotfiles_path/starship.toml $config_path/starship.toml

echo "   Linking git config..."
ln -sf $dotfiles_path/.gitconfig $HOME/.gitconfig

echo "   Linking global gitignore..."
ln -sf $dotfiles_path/.gitignore_global $HOME/.gitignore_global

echo "   Linking nushell config..."
ln -sf $dotfiles_path/nushell "$HOME/Library/Application Support/nushell"

echo "✅ Setup complete!"
echo "🔄 You may need to restart your terminal or run 'source ~/.zshrc' to apply changes."
