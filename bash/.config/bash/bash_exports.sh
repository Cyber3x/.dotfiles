# --- History settings ---
HISTCONTROL=ignoreboth # No duplicate lines or leading spaces
shopt -s histappend    # Append history instead of overwrite
HISTSIZE=1000          # Number of commands stored in memory
HISTFILESIZE=2000      # Number of commands stored in file

# --- Terminal behavior ---
shopt -s checkwinsize # Update window size after each command

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export FCEDIT='nvim'
export MANPAGER='nvim +Man!'

PATH_DIRS=(
  "$HOME/.config/composer/vendor/bin" # php composer
)

# Loop through and add if not already present
for dir in "${PATH_DIRS[@]}"; do
  if [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]]; then
    export PATH="$PATH:$dir"
  fi
done
