C_HOST='\[\e[38;5;203;1m\]'
C_PATH='\[\e[38;5;228;1m\]'

# start or attach to a tmux session on ssh connection
if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]] && command -v tmux >/dev/null; then
  tmux new-session -A -s server
fi
