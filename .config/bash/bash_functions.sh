confirm() {
    echo -n "Do you want to run $*? [N/y] "
    read -r REPLY
    if [[ "$REPLY" == "y" || "$REPLY" == "Y" ]]; then
        "$@"
    else
        echo "Cancelled by user"
    fi
}

tldrsearch() {
    tldr -l | fzf \
      --border \
      --preview-window='right:70%,nowrap' \
      --prompt='tldr> ' \
      --preview 'tldr {1} | bat -l bash --color=always'
}

mansearch() {
    local selection
    selection=$(man -k . | fzf --prompt='Man Pages> ') || return
    [[ -n $selection ]] && man "$(awk '{print $1}' <<< "$selection")"
}

# NOTE: override the default opening of nvim to stop me from opening file that don't exist
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
