## Induction

- os: Arch Linux

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
