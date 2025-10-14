# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load support bash files if present
for file in ~/.config/bash/bash_{aliases,exports,functions,prompt,tools}.sh; do
    if [ -f "$file" ]; then
        . "$file"
    else
        echo "⚠️$file not found"
    fi
done

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. "$HOME/.local/share/../bin/env"
