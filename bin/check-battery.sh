#!/bin/bash

BATTINFO=`acpi -b | grep -v unavailable | head -n 1`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " " | cut -f 1 -d '%'` < 20 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "    Low battery!" "$BATTINFO"
    /usr/bin/paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
fi
