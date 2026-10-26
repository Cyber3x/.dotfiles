# Login shells (tmux, ssh, tty) don't read ~/.bashrc on their own.
[ -f ~/.bashrc ] && . ~/.bashrc
