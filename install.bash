#!/bin/bash
HEIGHT=17
CHOICE_HEIGHT=9
WIDTH=96
BACKTITLE="Simple installer"
TITLE="[ Traffic Watch Installer ]"
MENU="Create symbolic link or copy the script:"

OPTIONS=(
SymLink   'sudo ln -s $(pwd)/traffic-get.bash /usr/local/bin/traffic-get'
Copy      'sudo cp $(pwd)/traffic-get.bash /usr/local/bin/traffic-get'
+ ' '
StatusCMD 'Create local status shortcut: traffic-get-status'
+ ' '
Remove       'sudo rm -f /usr/local/bin/traffic-get'
+ ' '
LocalStatus  'cat /tmp/traffic-get-*.log'
RemoteStatus 'ssh user@host.or.ip tail -n3 /tmp/traffic-get-INTERFACE.log'
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
	printf '\n\nNow you can use "traffic-get" as shell command\n\n'
        ;;

    Copy)
        sudo chmod +x "$(pwd)/traffic-get.bash"
        sudo cp "$(pwd)/traffic-get.bash" "/usr/local/bin/traffic-get"
	printf '\n\nNow you can use "sudo -b traffic-get LIMIT INTERFACE" as shell command\n\n'
        ;;

    StatusCMD)
	printf '\n#!/bin/sh\ncat /tmp/traffic-get-*.log\n' | sudo tee "/usr/local/bin/traffic-get-status"
	sudo chmod +x "/usr/local/bin/traffic-get-status"
	printf '\n\nNow you can use "sudo -b traffic-get LIMIT INTERFACE" as shell command\n\n'
        ;;

    Remove)
	sudo rm -f "/usr/local/bin/traffic-get" "/usr/local/bin/traffic-get-status" >/dev/null 2>&1
        ;;

    LocalStatus)
	cat "/tmp/traffic-get-*.log"
        ;;

    RemoteStatus)
        printf '\nTo check the status remotely, use the following command:\n'
	printf '\n\tuser@host.or.ip tail -n3 /tmp/traffic-get-INTERFACE.log\n'
	printf '\nReplace "user@host.or.ip" and "INTERFACE" with the actual value in use.\n\n'
        ;;

esac
