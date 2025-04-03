# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
ZSH_THEME="powerlevel10k/powerlevel10k"
export EDITOR=nvim
export VISUAL="$EDITOR"
export ZSH="$HOME/.oh-my-zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


plugins=(
	fzf
	git
	macos
	brew
	catimg
	colorize
	dotenv
	you-should-use
	thefuck
	vscode
	web-search
	iterm2
	zsh-bat
	zsh-autosuggestions
	zsh-history-substring-search
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# pnpm
export PNPM_HOME="/Users/adele/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/Desktop/Dev/.dotfiles/.p10k.zsh.
[[ ! -f ~/Desktop/Dev/.dotfiles/.p10k.zsh ]] || source ~/Desktop/Dev/.dotfiles/.p10k.zsh

export PATH="/opt/homebrew/opt/cython/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled)"

export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
