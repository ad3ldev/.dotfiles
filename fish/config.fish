if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables setting 
set -g fish_greeting
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

# init tools
starship init fish | source
zoxide init fish | source
fzf --fish | source
thefuck --alias | source
fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --shell fish | source
