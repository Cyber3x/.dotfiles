# fzf catppuccin teheme
# catppuccin frappe
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#737994,label:#C6D0F5"

# cattpuccin mocca
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
# --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
# --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
# --color=selected-bg:#45475A \
# --color=border:#6C7086,label:#CDD6F4"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# zoxide
eval "$(zoxide init bash)"

# zoxide fzf configuration
export _ZO_FZF_OPTS='--height 40% --layout reverse --border top'

# uv
eval "$(uv generate-shell-completion bash)"

# mise
eval "$(~/.local/bin/mise activate bash)"

# direnv
eval "$(direnv hook bash)"

# cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
