#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# local system configuration
if [ -f ~/.xinitrc.local ]; then
    source ~/.xinitrc.local
fi

# terminal for graphical environment, we use kitty
export TERMINAL=kitty

# keyboard speed
xset r rate 260 52

# swap esc and cap locks (macbook air)
setxkbmap -option caps:swapescape fr bepo

# desktop wallpaper and color
/usr/bin/feh --bg-scale --no-fehbg ~/.wallpaper.jpg

# notifications
/usr/bin/dunst &

/usr/bin/compton -b

#/usr/bin/udiskie -T -q --no-notify --use-udisks2 &


exec i3
