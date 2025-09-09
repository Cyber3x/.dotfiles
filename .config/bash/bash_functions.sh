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

mansearch() {
    man $(man -k . | fzf --prompt='Man Pages>' | awk '{print $1}')
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


# run the tbtl ci pipeline locally in any directory
local_ci() {
    # Absolute path to allowed base dir
    base_dir="$HOME/programming/tbtl/mono/projects"

    # Get current dir
    current_dir=$(pwd)

    build_docs=true
    if [[ "$1" == "--no-docs" ]]; then
        build_docs=false
    fi

    # Check if current dir is inside base_dir
    case "$current_dir" in
        "$base_dir" | "$base_dir"/*)
            echo "Running local CI pipeline..."
            "$base_dir/scripts/ci/rust/local_ci.sh" || return 1

            if $build_docs; then
                echo "Building documentation..."
                srun "$base_dir/scripts/ci/rust/build_documentation.sh" || return 1
            fi
            ;;
        *)
            echo "❌ Error: You must be inside $base_dir (or its subdirectories) to run this command."
            return 1
            ;;
    esac
}
