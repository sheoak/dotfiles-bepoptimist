#! /bin/sh
#
# check-vpn.sh
# Copyright (C) 2019 sheoak <sheoak@users.noreply.github.com>
#
# Distributed under terms of the MIT license.
# TODO: https://github.com/polybar/polybar/wiki/Formatting#foreground-color-f

if [[ -f /sys/class/net/tun0/dev_id ]]; then
    # echo " "
    echo ""
else
    echo "%{F#dc322f}%{F-}"
fi


