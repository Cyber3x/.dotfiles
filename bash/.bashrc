# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Load support bash files if present
for file in ~/.config/bash/bash_{aliases,exports,functions,tools}.sh; do
  if [ -f "$file" ]; then
    . "$file"
  else
    echo "⚠️$file not found"
  fi
done

# Host-specific overrides (prompt colors, aliases, ...).
# Create ~/.config/bash/hosts/<hostname>.sh to customize a machine.
if [ -f ~/.config/bash/hosts/"$(hostname)".sh ]; then
  . ~/.config/bash/hosts/"$(hostname)".sh
fi

# Prompt is loaded last so host files can override its colors
if [ -f ~/.config/bash/bash_prompt.sh ]; then
  . ~/.config/bash/bash_prompt.sh
fi
