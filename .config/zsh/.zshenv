# env
# Adds `~/.local/bin` directories and softlinks to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH="$PATH:${$(find ~/.local/bin -type l -printf %p:)%%:}"
export PATH=$PATH:~/.local/bin/:~/.local/share/cargo/bin/:~/.local/share/go/bin/

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"

# proxy
export PROXY_SERVER="127.0.0.1"
export PROXY_PORT=7890
export PROXY_ADDRESS=$PROXY_SERVER:$PROXY_PORT

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
