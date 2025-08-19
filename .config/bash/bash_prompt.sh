# git prompt
if [ -f ~/.config/bash/git-prompt.sh ]; then
    . ~/.config/bash/git-prompt.sh
fi
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "[%s]")';
PS1='\[\e[2m\][\[\e[38;5;208;1m\]\u\[\e[39m\]@\h\[\e[0;2m\]]\[\e[0m\] \[\e[2m\][\[\e[38;5;110;1m\]\w\[\e[0;2m\]]\[\e[0m\] \[\e[1m\]${PS1_CMD1}\n\[\e[0;2m\]\$\[\e[0m\] '

