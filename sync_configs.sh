#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/config"

mkdir -p "$CONFIG_DIR"

copy_if_exists() {
    local src="$1"
    local dest="$2"
    if [ -e "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp -r "$src" "$dest"
        echo "Copied: $src -> $dest"
    else
        echo "Skipped (not found): $src"
    fi
}

copy_if_exists "$HOME/.config/zed" "$CONFIG_DIR/zed"
copy_if_exists "$HOME/.vimrc" "$DOTFILES_DIR/.vimrc"
copy_if_exists "$HOME/.config/nvim" "$CONFIG_DIR/nvim"
copy_if_exists "$HOME/.config/niri" "$CONFIG_DIR/niri"
copy_if_exists "$HOME/.config/ghostty" "$CONFIG_DIR/ghostty"
copy_if_exists "$HOME/.config/yazi" "$CONFIG_DIR/yazi"
