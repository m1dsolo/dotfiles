## Induction

This repository is where I store my personal dotfiles, maybe you can find some *interestring stuff* here.

### My personal environment

- os: [Arch Linux](https://archlinux.org/)
- window manager: [DWM](https://dwm.suckless.org/)
- terminal: [ST](https://st.suckless.org/)

## install

### neovim

Add image support to neovim.
```bash
sudo pacman -S imagemagick luarocks lua51 ueberzugpp
luarocks --local --lua-version=5.1 install magick
```
### tmux
```bash
tmux source ~/.config/tmux/tmux.conf
```
then run tmux and press `<A-s>` + `I` to install tmux plugins.

### yazi

`yazi` is a blazing fast terminal file manager.

For installation details, please refer to [github](https://yazi-rs.github.io/docs/installation/#arch).

```bash
sudo pacman -S yazi ffmpeg p7zip jq poppler fd ripgrep fzf zoxide imagemagick ueberzugpp
```

### DWM

```bash
cd ./.local/src/dwm
sudo make clean install
```

## features

### neovim

There are too many interesting features in neovim, I only list a small part.
I will continue to update when I am free.
See more in [neovim plugins](./.config/nvim/lua/plugins).

1. leetcode

![show-leetcode](https://github.com/m1dsolo/dotfiles/assets/74849775/69ef3c3e-619e-4c01-8f08-52f85fc138cc)

see more in [leetcode.nvim](https://github.com/kawre/leetcode.nvim).

2. sql

![show-sql](https://github.com/m1dsolo/dotfiles/assets/74849775/c097b717-e9ba-4ffe-88fb-1cf146ac0cd8)

see more in [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui).

3. copilotchat

![show-copilotchat](https://github.com/m1dsolo/dotfiles/assets/74849775/5d0f5d90-bb81-41b3-856c-e463f5afb4ae)

see more in [vim-dadbod-ui](https://github.com/CopilotC-Nvim/CopilotChat.nvim).

4. notes

![show-obsidian](https://github.com/m1dsolo/dotfiles/assets/74849775/91d668b8-e19b-4961-a799-f5755763a088)

see more in [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) and [image.nvim](https://github.com/3rd/image.nvim).

### DWM

See more in [DWM website](https://dwm.suckless.org/).
Currently using version 6.5 with patches:
1. [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/)
2. [actualfullscreen](https://dwm.suckless.org/patches/actualfullscreen/)
3. [scratchpads](https://dwm.suckless.org/patches/scratchpads/)
4. [fullgaps](https://dwm.suckless.org/patches/fullgaps/)
5. [barpadding](https://dwm.suckless.org/patches/barpadding/)
6. [alpha.fixboarders](https://dwm.suckless.org/patches/alpha/)
7. [swallow](https://dwm.suckless.org/patches/swallow/)
8. [statuscmd](https://dwm.suckless.org/patches/statuscmd/)
