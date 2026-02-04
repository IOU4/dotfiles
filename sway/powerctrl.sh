#!/bin/bash
lock=" Lock"
logout=" Logout"
shutdown=" Shutdown"
reboot=" Reboot"

case $(
	wofi -d -L 4 -j <<EOF
$shutdown
$reboot
$logout
$lock 
EOF
) in
$shutdown) systemctl poweroff;;
$reboot) systemctl reboot;;
$lock) swaylock;;
$logout) swaymsg exit;;
esac
