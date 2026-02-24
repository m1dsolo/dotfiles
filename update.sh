#!/bin/bash

DOTFILES_PATH=$(realpath "$0")
DOTFILES_DIR=$(dirname "$DOTFILES_PATH")

ln -s "$DOTFILES_DIR"/.config/* ~/.config 2>/dev/null
ln -s "$DOTFILES_DIR"/.local/bin/* ~/.local/bin 2>/dev/null
ln -s "$DOTFILES_DIR"/.local/share/* ~/.local/share 2>/dev/null
