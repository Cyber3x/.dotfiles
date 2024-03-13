# handy ls aliases
alias ppath="echo $PATH | sed 's/:/\n/g'"

alias files="xdg-open"
alias studio="studio.sh 1>/dev/null 2>/dev/null & disown"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias reload=". ~/.bashrc"
alias soff="xset dpms force off"

alias cl="clear & ls"
alias cll="clear & ll"
alias cla="clear & la"

alias ls="exa"
alias ll="exa -lF"
alias sl="ls"
alias la="exa -laF"

alias python="python3"
alias py="python"
alias cd="z"

alias tks="tmux kill-session -t"
alias tns="tmux new -s"
alias tls="tmux ls"
alias tkall="confirm tmux kill-server"
