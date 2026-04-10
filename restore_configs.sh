#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$DOTFILES_DIR/.config"

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

restore_if_exists "$CONFIG_DIR/zed" "$HOME/.config/zed"
restore_if_exists "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
restore_if_exists "$CONFIG_DIR/nvim" "$HOME/.config/nvim"
restore_if_exists "$CONFIG_DIR/niri" "$HOME/.config/niri"
restore_if_exists "$CONFIG_DIR/ghostty" "$HOME/.config/ghostty"
restore_if_exists "$CONFIG_DIR/yazi" "$HOME/.config/yazi"
