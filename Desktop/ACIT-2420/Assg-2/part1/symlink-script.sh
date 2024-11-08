#!/bin/bash

if [ $(id -u) -ne 0 ]
    then echo "run this script as root <sudo ./symlink-script>"
    exit
else
    ln -sf ..config/kak/kakrc ~/bin
fi