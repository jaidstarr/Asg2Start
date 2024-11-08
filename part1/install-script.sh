#!/bin/bash

if [ $(id -u) -ne 0 ]
    then echo "run this script as root <sudo ./install-script>"
    exit
else
    cat packages.txt | while read line
    do 
        pacman -S --noconfirm $line
    done
fi
