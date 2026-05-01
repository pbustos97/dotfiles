#!/bin/bash
set -e

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

copy_if_exists "$HOME_CONFIG_DIR/zed" "$CONFIG_DIR/zed"
copy_if_exists "$HOME/.vimrc" "$DOTFILES_DIR/.vimrc"
copy_if_exists "$HOME_CONFIG_DIR/nvim" "$CONFIG_DIR/nvim"
copy_if_exists "$HOME_CONFIG_DIR/niri" "$CONFIG_DIR/niri"
copy_if_exists "$HOME_CONFIG_DIR/ghostty" "$CONFIG_DIR/ghostty"
copy_if_exists "$HOME_CONFIG_DIR/yazi" "$CONFIG_DIR/yazi"
copy_if_exists "$HOME_CONFIG_DIR/xdg-desktop-portal" "$CONFIG_DIR/xdg-desktop-portal"

