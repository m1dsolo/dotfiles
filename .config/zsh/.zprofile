# Start graphical server on user's current tty if not already running.
if [ "$(tty)" = "/dev/tty1" ]; then
    if pacman -Qs libxft-bgra >/dev/null 2>&1; then
        ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
    else
        echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
    Please run:
        \033[32myay -S libxft-bgra-git\033[0m
    and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`."
    fi
fi
