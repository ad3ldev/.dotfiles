#!/bin/sh

defaults write com.apple.dock autohide-time-modifier -float 0.5; killall Dock

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install from brewdump

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install from App Store:
# - Amphetamine and Amphetamine-Enhancer
# - Encrypto
# - Notion Web Clipper
# - RunCat

ln -s /Users/adele/Desktop/Dev/.dotfiles/ghostty/ ~/.config/ghostty
ln -s /Users/adele/Desktop/Dev/.dotfiles/nvim/ ~/.config/nvim/
ln -s /Users/adele/Desktop/Dev/.dotfiles/.bash_profile ~/.bash_profile
ln -s /Users/adele/Desktop/Dev/.dotfiles/.bashrc ~/.bashrc
ln -s /Users/adele/Desktop/Dev/.dotfiles/.gitconfig ~/.gitconfig
ln -s /Users/adele/Desktop/Dev/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s /Users/adele/Desktop/Dev/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s /Users/adele/Desktop/Dev/.dotfiles/.zshrc ~/.zshrc




