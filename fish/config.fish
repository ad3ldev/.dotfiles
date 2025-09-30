if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Create aliases for explicit architecture selection
alias brew_x86 'arch -x86_64 /usr/local/bin/brew'
alias ibrew 'arch -x86_64 /usr/local/bin/brew'

# Variables setting 
set -g fish_greeting
set -gx EDITOR nvim
set -gx VISUAL nvim

# # Add Go bin to PATH
set -gx PATH $PATH (go env GOPATH)/bin
# # Add Haskell bin to PATH
set -gx PATH "$HOME/.ghcup/bin" $PATH

# Aliases
alias vim="nvim"
alias grep="rg"
alias find="fd"
alias cat="bat"
alias ls="eza"
alias cd="z"
alias du="dust"

# init tools
starship init fish | source
zoxide init fish | source
fzf --fish | source
thefuck --alias | source
fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --shell fish | source

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/adele/.opam/opam-init/init.fish' && source '/Users/adele/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
