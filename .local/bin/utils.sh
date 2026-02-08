#!/bin/bash

check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error：not found command $1 !"
        exit 1
    fi
}

check_directory() {
    if [ ! -d "$1" ]; then
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
