# m1dsolo's dotfiles

## Introduction

This repository contains my personal dotfiles. You might find some interesting configurations here.

> [!Note]
> I use [Arch Linux](https://archlinux.org/), so some configurations may not work on other distributions.
> However, you can still use them as a reference.

## Features

- [**dwm**](https://dwm.suckless.org/): A dynamic window manager.
- [**st**](https://st.suckless.org/): A simple terminal emulator.
- [**dmenu**](https://tools.suckless.org/dmenu/): A dynamic menu.
- [**dwmblocks**](https://github.com/torrinfail/dwmblocks): A status bar.
- [**neovim**](https://neovim.io/): A powerful text editor.
- [**yazi**](https://github.com/sxyazi/yazi): A blazing fast terminal file manager.
- [**tmux**](https://github.com/tmux/tmux): A terminal multiplexer.
- [**picom**](https://github.com/yshui/picom): A compositor.

## Additional Information

For more details, see the [wiki](https://github.com/m1dsolo/dotfiles/wiki).

## Installation

```bash
git clone https://github.com/m1dsolo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./init.sh
```

In order to use `setbg` to set wallpaper, you need to download a wallpaper and symlink it to `~/.local/share/bg`:
