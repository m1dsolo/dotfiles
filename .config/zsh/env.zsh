# proxy
function setproxy() {
    export {http,https,ftp}_proxy="http://$PROXY_ADDRESS"
}

function unsetproxy() {
    unset {http,https,ftp}_proxy
}

function echoproxy() {
    echo $http_proxy
}
