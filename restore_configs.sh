#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/directories.json"
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/.config"
HOME_CONFIG_DIR="$HOME/.config"

restore_if_exists() {
    local src="$1"
    local dest="$2"
    if [ -e "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        rm -rf "$dest"
        cp -r "$src" "$dest"
        echo "Restored: $src -> $dest"
    else
        echo "Skipped (not found): $src"
    fi
}

while IFS= read -r entry; do
    source_dotfiles="$(echo "$entry" | jq -r '.dotfiles')"
    dest="$(echo "$entry" | jq -r '.source')"
    restore_if_exists "$DOTFILES_DIR/$source_dotfiles" "$HOME/$dest"
done < <(jq -c '.directories[]' "$CONFIG_FILE")