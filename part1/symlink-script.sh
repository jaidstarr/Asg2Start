#!/bin/bash

if [ $(id -u) -ne 0 ]
    then echo "run this script as root <sudo ./symlink-script>"
    exit
else
    mkdir -p "~/.config/kak"
    mkdir -p "~/.config/tmux"

    ln -sf ~/Asg2Start/config/tmux/tmux.conf ../.config/tmux
    ln -sf ~/Asg2Start/config/kak/kakrc ../.config/kak
fi
