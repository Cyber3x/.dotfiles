confirm() {
    echo -n "Do you want to run $*? [N/y] "
    read -r REPLY
    if [[ "$REPLY" == "y" || "$REPLY" == "Y" ]]; then
        "$@"
    else
        echo "Canceled by user"
    fi
}

tldrsearch() {
    local selection
    selection=$(tldr -l | fzf \
        --prompt='tldr> ' \
        --height=80% \
        --layout=reverse \
        --border=none \
        --preview-window='right:70%,nowrap' \
        --preview 'tldr {+} | bat -l markdown --color=always --paging=never --style=plain'
    ) || return
    [[ -n $selection ]] && tldr "$selection"
}

mansearch() {
    local selection
    selection=$(man -k . | fzf \
        --prompt='Man Pages> ' \
        --height=80% \
        --layout=reverse \
        --preview-window='right:70%,nowrap' \
        --preview 'man $(awk "{print substr(\$1,2)}" <<< "{}") | bat -l Manpage --color=always --paging=never --style=plain' \
    ) || return

    [[ -n $selection ]] && man "$(awk '{print substr($1,2)}' <<< "$selection")"
}

#NOTE: override the default opening of nvim to stop me from opening file that don't exist
nvim() {
  for file in "$@"; do
    # only check if it's not an option (starts with -)
    if [ "${file#-}" = "$file" ] && [ ! -e "$file" ]; then
      echo "nvim: $file does not exist" >&2
      return 1
    fi
  done
  command nvim "$@"
}
