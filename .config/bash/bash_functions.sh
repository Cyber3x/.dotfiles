confirm() {
    echo -n "Do you want to run $*? [N/y] "
    read -N 0 REPLY
    echo
    if test "$REPLY" = "y" -o "$REPLY" = "Y"; then
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

