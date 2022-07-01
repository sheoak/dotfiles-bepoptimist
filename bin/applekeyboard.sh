#! /bin/sh
# https://bbs.archlinux.org/viewtopic.php?id=206555

# env >> /tmp/apple-udev.log

export DISPLAY XAUTHORITY HOME

# echo "DISPLAY $DISPLAY" >> /tmp/debugme.log
# echo "XAUTHORITY $XAUTHORITY" >> /tmp/debugme.log
# echo "HOME $HOME" >> /tmp/debugme.log
# echo `whoami` >> /tmp/debugme.log

/usr/bin/setxkbmap -option ctrl:nocaps fr bepo
/usr/bin/xset r rate 240 56
xcape -e 'Control_L=Escape'

notify-send "Apple keyboard detected"
