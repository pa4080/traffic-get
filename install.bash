#!/bin/bash

MSG1='Now you can use as shell command:'
MSG2='traffic-get <interface name> <units of measurement> <period of measure> <type of the output>'
MSG3='traffic-get enp0s25 MiB 30 total'

HEIGHT=12
CHOICE_HEIGHT=4
WIDTH=96
BACKTITLE="Simple installer"
TITLE="[ Traffic Watch Installer ]"
MENU="Create symbolic link or copy the script:"

OPTIONS=(
SymLink   'sudo ln -s $(pwd)/traffic-get.bash /usr/local/bin/traffic-get'
Copy      'sudo cp $(pwd)/traffic-get.bash /usr/local/bin/traffic-get'
+ ' '
Remove       'sudo rm -f /usr/local/bin/traffic-get'
)

CHOICE=$(whiptail --clear \
    --backtitle "$BACKTITLE" \
    --title "$TITLE" \
    --menu "$MENU" \
    $HEIGHT $WIDTH $CHOICE_HEIGHT \
    "${OPTIONS[@]}" \
    2>&1 >/dev/tty)

clear
case $CHOICE in
    SymLink)
        sudo chmod +x "$(pwd)/traffic-get.bash"
        sudo ln -s "$(pwd)/traffic-get.bash" "/usr/local/bin/traffic-get"
	printf '%s\n\t%s\n\t%s\n\n' "$MSG1" "$MSG2" "$MSG3"
        ;;

    Copy)
        sudo chmod +x "$(pwd)/traffic-get.bash"
        sudo cp "$(pwd)/traffic-get.bash" "/usr/local/bin/traffic-get"
	printf '\n\n%s\n\n' "${MESSAGE}"
        ;;

    Remove)
	sudo rm -f "/usr/local/bin/traffic-get" "/usr/local/bin/traffic-get-status" >/dev/null 2>&1
        ;;

esac
