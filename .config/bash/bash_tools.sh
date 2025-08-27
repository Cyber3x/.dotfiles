
# zoxide
eval "$(zoxide init bash)"
# I think this is added by zoxide
. "$HOME/.local/bin/env"
# zoxide fzf configuration
export _ZO_FZF_OPTS='--height 40% --layout reverse --border top'

# set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# uv
eval "$(uv generate-shell-completion bash)"

# cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# node version manager - nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
