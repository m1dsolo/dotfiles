#!/bin/bash

check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        notify-send -u critical "Error" "Not found command $1 !"
        echo "Error：not found command $1 !"
        exit 1
    fi
}

check_directory() {
    if [ ! -d "$1" ]; then
        notify-send -u critical "Error" "Not found directory $1 !"
        echo "Error：not found directory $1 !"
        exit 1
    fi
}

get_editor() {
    if command -v nvim &> /dev/null; then
        echo "nvim"
    else
        echo "vim"
    fi
}
