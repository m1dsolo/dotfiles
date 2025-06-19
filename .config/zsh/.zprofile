#!/bin/zsh

# Adds `~/.local/bin` directories and softlinks to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH="$PATH:${$(find ~/.local/bin -type l -printf %p:)%%:}"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

# Start graphical server on user's current tty if not already running.
# if [ "$(tty)" = "/dev/tty1" ]; then
#     if pacman -Qs libxft-bgra >/dev/null 2>&1; then
#         ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
#     else
#         echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
#     Please run:
#         \033[32myay -S libxft-bgra-git\033[0m
#     and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`."
#     fi
# fi

startx "$XINITRC"

sudo -n loadkeys ~/.local/share/ttymaps.kmap 2>/dev/null
