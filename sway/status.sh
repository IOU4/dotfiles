#!/bin/sh
# © 2012 Michael Stapelberg, Public Domain

# This script is a trivial shell script to send your own output to i3bar while
# using the JSON protocol.
#
# It is ugly and that is inherent to using JSON with shell scripts. You
# _really_ should not do that. See i3status or i3status’s contrib/ directory
# for examples of how to handle the output in higher-level languages.
#
# This example is purely for illustration of the protocol. DO NOT USE IT IN THE
# REAL WORLD.

# Send the header so that i3bar knows we want to use JSON:
echo '{ "version": 1 }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

js='
   "name": "time",
   "border": "ffffff",
   "border_left": 0,
   "border_top": 0,
   "border_right": 0,
   "border_bottom": 1,
   "separator": false,
   "separator_block_width": 20,
   "align": "right",
   "full_text": 
   '

# Now send blocks with information forever:
while :;
do
    light=$(cat /sys/class/backlight/intel_backlight/brightness)
    let light/=8,9
    light="\"   $light%\""

    date="\"   $(date +'%d-%m')\""

    time="\"  $(date +'%l:%M')\""
    
    if [ "$(cat /sys/class/power_supply/BAT1/status)" = "Charging" ]; then stat=''; else stat=''; fi; if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ]; then stat=''; fi
    bat="\"$stat  $(cat /sys/class/power_supply/BAT1/capacity)% $(cat /sys/class/power_supply/BAT0/capacity)%\""

    vol="\"墳  $(awk -F"[][]" '/Mono:/ { print $2 }' <(amixer get Master))\""

    ram="\"﬙   $(free -h | awk '/Mem/{print $3}')\""

    cpu="\"龍  $(grep 'cpu ' /proc/stat | awk '{printf("%.1f%"),($2+$4)*100/($2+$4+$5)}')\""

    echo ",[
      { $js $date  },
      { $js $time  },
      { $js $bat   },
      { $js $light },
      { $js $vol   },
      { $js $ram   },
      { $js $cpu   }
      ]"
	sleep 10
done
