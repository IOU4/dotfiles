#!/bin/bash
title=$(playerctl -a metadata --format '{{markup_escape(title)}} -F'| sed 's/\[[^]]*\]\.[^.]*//g')
playerName=$(playerctl -a metadata --format '{{playerName}}' -F)
status=$(playerctl -a metadata --format '{{status}}' -F)
echo "{\"text\": \"$title\", \"tooltip\": \"$playerName : $title\", \"alt\": \"$status\", \"class\": \"$status\"}"
