install_with_curl() {
    local cmd="$1"
    local url="$2"
    local install_cmd="${3:-bash}"  # default to bash if not specified

    if command -v "$cmd" >/dev/null 2>&1; then
        echo "$cmd is already installed"
        return 0
    fi

    echo "$cmd is not installed"
    echo "Installing $cmd"
    curl -fsSL "$url" | $install_cmd
}

install_yazi_plugin() {
    local plugin_name="$1"
    local repo="${2:-yazi-rs/plugins}"

    if [[ "$repo" == "yazi-rs/plugins" ]]; then
        ya pkg delete "$repo:$plugin_name"
        ya pkg add "$repo:$plugin_name"
    else
        ya pkg delete "$repo/$plugin_name"
        ya pkg add "$repo/$plugin_name"
    fi
}
