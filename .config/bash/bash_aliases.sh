alias breload="source ~/.bashrc && echo '.bashrc reloaded!'"
alias brcedit="nvim ~/.dotfiles/.bashrc && breload"
alias baedit="nvim ~/.dotfiles/.config/bash/bash_aliases.sh && breload"

alias v="nvim"

alias yeet="rm -rfi"

alias ..="z .."
alias cd="z"

alias files="xdg-open"
alias ppath='echo "$PATH" | tr ":" "\n"'

alias ls="eza --icons=always"
alias l="ls -l"
alias lsc="clear && l"
alias la="ls -al"
alias ll="ls -l"
alias lt="ls --tree --level=2"

alias tls="tmux ls"
alias tns="tmux new -s"
alias tas="tmux a -t"
alias tks="confirm tmux kill-session -t"

alias pythonheretoo='export PYTHONPATH=$PYTHONPATH:.'  # Add current dir to path

alias python3.12='uv run --python=3.12 python3'
alias python3.14='uv run --python=3.14 python3'
alias py="python"

alias soff="xset dpms force off"

alias fzf="fzf --style minimal \
    --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"
