#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "Low battery!" "$BATTINFO"
    /usr/bin/paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
fi