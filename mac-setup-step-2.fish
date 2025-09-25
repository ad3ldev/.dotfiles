#!/usr/bin/env fish

# macOS Development Environment Setup Script
# This script sets up development tools and dotfiles

echo "��� Starting macOS development environment setup..."

# Install from Brewfile
echo "📦 Installing packages from Brewfile..."
if test -f Brewfile
    brew bundle
else
    echo "⚠️  Brewfile not found in current directory"
end

# Remind user about App Store installations
echo "🍎 Please install the following apps from the App Store:"
echo "   - Amphetamine and Amphetamine-Enhancer"
echo "   - Encrypto"
echo "   - Notion Web Clipper"
echo "   - RunCat"
echo ""

# Create symbolic links for dotfiles
echo "🔗 Creating symbolic links for dotfiles..."

set dotfiles_path "/Users/adele/Personal/Dev/.dotfiles"
set config_path "$HOME/.config"

# Ensure .config directory exists
mkdir -p $config_path

# Create symlinks
echo "   Linking ghostty config..."
ln -sf $dotfiles_path/ghostty $config_path/ghostty

echo "   Linking fish config..."
ln -sf $dotfiles_path/fish $config_path/fish

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
echo "🔄 You may need to restart your terminal or run 'source ~/.config/fish/config.fish' to apply changes."
