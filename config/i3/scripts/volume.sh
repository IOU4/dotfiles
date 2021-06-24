# bin/bash

VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master))
MAX="100%"
if [ "$VOL" = "$MAX" ] 
then
		amixer -D pulse sset Master 100%
fi		
echo $VOL
