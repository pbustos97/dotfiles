SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/install_funcs.sh"

PLUGINS_FILE="$SCRIPT_DIR/plugins.yazi.txt"

while IFS= read -r line || [[ -n "$line" ]]; do
    plugin=$(echo "$line" | awk '{print $1}')
    repo=$(echo "$line" | awk '{print $2}')

    if [[ -n "$repo" ]]; then
        install_yazi_plugin "$plugin" "$repo"
    else
        install_yazi_plugin "$plugin"
    fi
done < "$PLUGINS_FILE"