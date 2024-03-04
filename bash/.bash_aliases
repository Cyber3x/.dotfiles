# handy ls aliases


alias files="xdg-open"
alias studio="studio.sh 1>/dev/null 2>/dev/null & disown"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias reload=". ~/.bashrc"
alias soff="xset dpms force off"
alias ppath="echo $PATH | sed 's/:/\n/g'"

alias cl="clear & ls"
alias cll="clear & ll"
alias cla="clear & la"

alias gb="git branch"
alias gs="git status"
alias gsw="git switch"
alias gc="git checkout"

alias ls="exa"
alias ll="exa -lF"
alias sl="ls"
alias la="exa -laF"
alias python="python3"
