#!/bin/bash
lock=""
logout=""
shutdown=""
reboot=""
sleep=""

case $(
	wofi -c ~/dotfiles/wofi/power.conf -s ~/dotfiles/wofi/power.css <<EOF | sed 's/^ *//'
    $shutdown
    $reboot
    $logout
    $sleep
    $lock 
EOF
) in
$shutdown)
	systemctl poweroff
	;;
$reboot)
	systemctl reboot
	;;
$sleep)
	systemctl suspend
	;;
$lock)
	swaylock
	;;
$logout)
	swaymsg exit
	;;
esac
