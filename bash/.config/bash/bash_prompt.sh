# -----------------------------
# Git Prompt
# -----------------------------
export GIT_PS1_SHOWDIRTYSTATE=1        # Show staged (+) / unstaged (*) changes
export GIT_PS1_SHOWUNTRACKEDFILES=1    # Show untracked files (%)
export GIT_PS1_SHOWSTASHSTATE=1        # Show stash ($)
export GIT_PS1_SHOWUPSTREAM="auto"     # Show upstream status
export GIT_PS1_SHOWCOLORHINTS=1        # Color hints

# git ships the prompt script; its path differs per distro
for file in \
  /run/current-system/sw/share/bash-completion/completions/git-prompt.sh \
  /usr/share/git/completion/git-prompt.sh \
  /usr/lib/git-core/git-sh-prompt; do
  if [ -f "$file" ]; then
    . "$file"
    break
  fi
done


# -----------------------------
# Colors
# -----------------------------
C_DIM='\[\e[2m\]'
C_RESET='\[\e[0m\]'
C_BOLD='\[\e[1m\]'

# Default theme; hosts/<hostname>.sh can set these before this file loads
C_USER="${C_USER:-\[\e[38;5;208;1m\]}"   # orange
C_PATH="${C_PATH:-\[\e[38;5;110;1m\]}"   # cyan
C_NIX="${C_NIX:-\[\e[38;5;37m\]}"        # dark cyan
C_HOST="${C_HOST:-}"                     # default: terminal foreground


# -----------------------------
# Nix Prompt (NO COLOR HERE)
# -----------------------------
nix_prompt() {
    [[ -z "$IN_NIX_SHELL" ]] && return

    if [[ -n "$NIX_SHELL_NAME" ]]; then
        printf "%s" "$NIX_SHELL_NAME"
        return
    fi

    if [[ -n "$name" ]]; then
        printf "%s" "$name"
        return
    fi

    printf "nix"
}


# -----------------------------
# Git Branch Injection
# -----------------------------
# Prepend to PROMPT_COMMAND without clobbering hooks added by zoxide/mise/direnv
# [git branch] (bold); __git_ps1 adds the brackets, \001/\002 mark the colors as zero-width
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "\001\e[2m\002[\001\e[0;1m\002%s\001\e[0;2m\002]\001\e[0m\002")'"${PROMPT_COMMAND:+;$PROMPT_COMMAND}"


# -----------------------------
# PS1 Construction
# -----------------------------
PS1=""

# [user@host]
PS1+="${C_DIM}[${C_USER}\u${C_RESET}@${C_HOST}\h${C_RESET}${C_DIM}]${C_RESET}"

# [cwd]
PS1+="${C_DIM}[${C_PATH}\w${C_RESET}${C_DIM}]${C_RESET}"

# [nix shell], only inside one
PS1+='$(ns=$(nix_prompt); [[ -n "$ns" ]] && printf "'${C_DIM}'['${C_RESET}${C_NIX}' %s'${C_RESET}${C_DIM}']'${C_RESET}'" "$ns")'

# git branch
PS1+="\${PS1_CMD1}"

# newline + prompt symbol
PS1+="\n${C_DIM}\$${C_RESET} "
