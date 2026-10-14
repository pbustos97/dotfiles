#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/directories.json"
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/.config"
HOME_CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

copy_if_exists() {
    local src="$1"
    local dest="$2"
    if [ -e "$src" ]; then
        rm -rf "$dest"
        mkdir -p "$(dirname "$dest")"
        cp -rf "$src" "$dest"
        echo "Copied: $src -> $dest"
    else
        echo "Skipped (not found): $src"
    fi
}

while IFS= read -r entry; do
    source="$(echo "$entry" | jq -r '.source')"
    dest_dotfiles="$(echo "$entry" | jq -r '.dotfiles')"
    copy_if_exists "$HOME/$source" "$DOTFILES_DIR/$dest_dotfiles"
done < <(jq -c '.directories[]' "$CONFIG_FILE")

# Flatpak apps (runtimes excluded)
if command -v flatpak >/dev/null 2>&1; then
    flatpak list --app --columns=application \
        | grep -v '^Application ID$' \
        > "$SCRIPT_DIR/install_scripts/flatpaks.txt" || true
    echo "Wrote: install_scripts/flatpaks.txt"
else
    echo "Skipped (flatpak not installed)"
fi
