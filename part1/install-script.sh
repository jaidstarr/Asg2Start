#!/bin/bash

if [ $(id -u) -ne 0 ]  # if this script is run by itself, this line will check the users ID (UID) with "id -u" and see if it is not equal (-ne) to 0. if a UID is 0 then they have root privileges and would not need to use sudo. <https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script>
    then echo "run this script as root <sudo ./install-script>"
    exit
else
  cat packages.txt | while read line  # cat is used to read the text files contents. |(pipe) takees the output of the file and turns it into an input for "while read line" each line of te file gets stored in the variable $line. <https://www.javatpoint.com/bash-read-file> <https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash>
    do 
        pacman -S --noconfirm $line #pacman is the page installer that will then install each pakage into the system. "--noconfirm" makes it so you will not need to hit y to install each pakage. <https://bbs.archlinux.org/viewtopic.php?id=121792>
    done
fi
