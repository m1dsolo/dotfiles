# env
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="${XDG_CONFIG_HOME}/x11/xinitrc"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME}/go"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"

# proxy
export PROXY_SERVER="127.0.0.1"
export PROXY_PORT=7890
export PROXY_ADDRESS=$PROXY_SERVER:$PROXY_PORT

function setproxy() {
    export {http,https,ftp}_proxy="http://$PROXY_ADDRESS"
}

function unsetproxy() {
    unset {http,https,ftp}_proxy
}

function echoproxy() {
    echo $http_proxy
}

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
