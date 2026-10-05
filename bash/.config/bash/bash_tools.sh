# fzf catppuccin teheme
# catppuccin frappe
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#737994,label:#C6D0F5"

# fzf key bindings (Ctrl-R history, Ctrl-T files, Alt-C cd) and completion
eval "$(fzf --bash)"

# zoxide
eval "$(zoxide init bash)"

# zoxide fzf configuration
export _ZO_FZF_OPTS='--height 40% --layout reverse --border top'
