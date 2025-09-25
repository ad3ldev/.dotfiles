eval
fuck() {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING
    export TF_SHELL=zsh
    export TF_ALIAS=fuck
    TF_SHELL_ALIASES=$(alias)
    export TF_SHELL_ALIASES
    TF_HISTORY="$(fc -ln -10)"
    export TF_HISTORY
    export PYTHONIOENCODING=utf-8
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD
    unset TF_HISTORY
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING
    test -n "$TF_CMD" && print -s $TF_CMD
}

eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled)"

. "$HOME/.cargo/env"
