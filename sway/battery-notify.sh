#!/bin/bash

# Battery notification script for Sway/Mako
# Checks battery level every 2 minutes and notifies if below 15%

LOW_BATTERY_THRESHOLD=15
CRITICAL_BATTERY_THRESHOLD=5
CHECK_INTERVAL=120 # seconds

# Keep track of whether we've already notified to avoid spam
notified_low=false
notified_critical=false

while true; do
    if [ -d "/sys/class/power_supply/BAT0" ]; then
        capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status)

        if [ "$status" = "Discharging" ]; then
            if [ "$capacity" -le "$CRITICAL_BATTERY_THRESHOLD" ]; then
                if [ "$notified_critical" = false ]; then
                    notify-send -u critical "BATTERY CRITICAL" "Battery level is at ${capacity}%! Plug in now!"
                    notified_critical=true
                fi
            elif [ "$capacity" -le "$LOW_BATTERY_THRESHOLD" ]; then
                if [ "$notified_low" = false ]; then
                    notify-send -u normal "Battery Low" "Battery level is at ${capacity}%."
                    notified_low=true
                fi
            else
                # Reset flags if battery is above thresholds but still discharging (shouldn't happen often)
                notified_low=false
                notified_critical=false
            fi
        else
            # Reset flags if charging
            notified_low=false
            notified_critical=false
        fi
    fi
    sleep "$CHECK_INTERVAL"
done
