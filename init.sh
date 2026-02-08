#!/bin/bash

set -x

DOTFILES_PATH=$(realpath "$0")
DOTFILES_DIR=$(dirname "$DOTFILES_PATH")

# config

mkdir ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/src
mkdir -p ~/.local/share
mkdir -p ~/.cache/zsh  # for save history

ln -s "$DOTFILES_DIR"/.config/* ~/.config
ln -s "$DOTFILES_DIR"/.local/bin/* ~/.local/bin
ln -s "$DOTFILES_DIR"/.local/share/* ~/.local/share

ln -s "$DOTFILES_DIR"/.config/zsh/.zshenv ~

cd ~/.local/src/dwm
sudo make clean install
cd ~/.local/src/st
sudo make clean install
cd ~/.local/src/dmenu
sudo make clean install
cd ~/.local/src/dwmblocks
sudo make clean install
