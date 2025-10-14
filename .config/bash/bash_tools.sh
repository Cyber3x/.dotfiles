
# zoxide
eval "$(zoxide init bash)"
# I think this is added by zoxide
. "$HOME/.local/bin/env"
# zoxide fzf configuration
export _ZO_FZF_OPTS='--height 40% --layout reverse --border top'

# set up fzf key bindings and fuzzy completion

# fzf catppuccin teheme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# uv
eval "$(uv generate-shell-completion bash)"

# cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# node version manager - nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
