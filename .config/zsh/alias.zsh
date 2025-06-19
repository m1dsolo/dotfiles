#!/bin/sh

# use neovim instead of vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

# add sudo
for command in mount umount pacman su shutdown poweroff reboot; do
	alias $command="sudo $command"
done; unset command

# add flag
alias cp="cp -iv"
alias diff="diff --color=auto"
alias ls="ls -vhN --color=auto --group-directories-first"
alias mv="mv -iv"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias tree="tree -C"
command -v trash-put &>/dev/null && alias rm="trash-put"

alias chromium="chromium --proxy-server=$PROXY_ADDRESS"
alias gdb="gdb -q"
alias ffmpeg="ffmpeg -hide_banner"
alias youtube-dl="youtube-dl --add-metadata -i"

# abbreviations
alias lg="lazygit"
