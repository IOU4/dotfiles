#!/bin/bash
case $(
	wofi -d -L 6 -l 9 -W 100 \
		-D dynamic_lines=true <<EOF | sed 's/^ *//'
    Shutdown
    Reboot
    Log off
    Sleep
    Lock
    Cancel
EOF
) in
"Shutdown")
	systemctl poweroff
	;;
"Reboot")
	systemctl reboot
	;;
"Sleep")
	systemctl suspend
	;;
"Lock")
	swaylock
	;;
"Log Out")
	swaymsg exit
	;;
esac
