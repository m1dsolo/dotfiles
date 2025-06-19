# path
export PATH=$PATH:~/.local/bin/:~/.local/share/cargo/bin/

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

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
