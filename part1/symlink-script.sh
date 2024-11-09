#!/bin/bash

if [ $(id -u) -ne 0 ]  # if this script is run by itself, this line will catch the users ID (UID) with "id -u" and see if it is not equal (-ne) to 0. if a UID is 0 then they have root privileges and would not need to use sudo <https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script>
    then echo "run this script as root <sudo ./symlink-script>"
    exit
else
  # mkdir creates a new directory, -p makes sure there are the correct parent directories. in this case, the parent dir ".config" is getting created as well as the "kak" dir being created inside the parent. <https://stackoverflow.com/questions/20089586/what-does-the-mkdir-p-mean-in-a-script-file#:~:text=mkdir%20-p%20means%3A%20create%20the,if%20required%2C%20all%20parent%20directories.>
    mkdir -p "~/.config/kak"
    mkdir -p "~/.config/tmux"

    # ln creates a new symbolic link. <https://www.freecodecamp.org/news/linux-ln-how-to-create-a-symbolic-link-in-linux-example-bash-command/> -sf is used to update the link rather then using just "-s" which would not ovewrite if the script was already run. <https://stackoverflow.com/questions/1951742/how-can-i-symlink-a-file-in-linux> the first path is the path to the actual file and the second path is where you want the destination path to be.
    ln -sf ~/Asg2Start/config/tmux/tmux.conf ../.config/tmux
    ln -sf ~/Asg2Start/config/kak/kakrc ../.config/kak
fi
