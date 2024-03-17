## Induction

This repository is where I store my personal dotfiles, maybe you can find some *interestring stuff* here.

### My personal environment

- os: [Arch Linux](https://archlinux.org/)
- window manager: [DWM](https://dwm.suckless.org/)
- terminal: [ST](https://st.suckless.org/)

## install

### neovim

For leetcode.nvim to display images
```bash
sudo pacman -S imagemagick luarocks lua51
yay -S ueberzugpp
luarocks --local --lua-version=5.1 install magick
```
### tmux
```bash
tmux source ~/.config/tmux/tmux.conf
```
then run tmux and press `<A-s>` + `I` to install tmux plugins.

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

5. algorithm template snippets

see more in [algorithm.snippets](./.config/nvim/snippets/cpp/algorithm.snippets).

