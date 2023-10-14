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

alias cl="clear & ls"
alias cll="clear & ll"
alias cla="clear & la"

DIR_PROG_FAKS="~/programming/faks"
alias pfw="cd $DIR_PROG_FAKS/web"
alias pfo="cd $DIR_PROG_FAKS/os"
alias pfu="cd $DIR_PROG_FAKS/utr"

alias gb="git branch"
alias gs="git switch"
alias gc="git checkout"

alias ls="exa"
alias ll="exa -lF"
alias la="exa -laF"
