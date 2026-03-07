# -----------------------------
# Git Prompt
# -----------------------------
if [ -f ~/.config/bash/git-prompt.sh ]; then
    . ~/.config/bash/git-prompt.sh
fi


# -----------------------------
# Colors
# -----------------------------
C_DIM='\[\e[2m\]'
C_RESET='\[\e[0m\]'
C_BOLD='\[\e[1m\]'

C_USER='\[\e[38;5;208;1m\]'   # orange
C_PATH='\[\e[38;5;110;1m\]'   # cyan
C_NIX='\[\e[38;5;37m\]'         # dark cyan


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
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "[%s]")'


# -----------------------------
# PS1 Construction
# -----------------------------
PS1=""

# [user@host]
PS1+="${C_DIM}[${C_USER}\u${C_RESET}@\h${C_DIM}]${C_RESET}"

# [cwd]
PS1+="${C_DIM}[${C_PATH}\w${C_RESET}${C_DIM}]${C_RESET} "

# Add nix prompt only if non-empty, no extra spaces
PS1+='$(ns=$(nix_prompt); [[ -n "$ns" ]] && printf "'${C_NIX}'[ %s] '${C_RESET}'" "$ns")'

# git branch (bold)
PS1+="${C_BOLD}\${PS1_CMD1}"

# newline + prompt symbol
PS1+="\n${C_DIM}\$${C_RESET} "
