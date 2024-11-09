#!/bin/bash

if [ $(id -u) -ne 0 ]  # if this script is run by itself, this line will catch the users ID (UID) with "id -u" and see if it is not equal (-ne) to 0. if a UID is 0 then they have root privileges and would not need to use sudo.
  then echo "please run this script as root <sudo ./main.sh>"
  exit

else
  ./install-script.sh  # runs the script to install the packages

  ./symlink-script.sh  # runs the script to create the symbolic links 
fi

