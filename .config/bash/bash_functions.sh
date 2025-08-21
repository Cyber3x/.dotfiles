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

