#!/bin/sh
#userresources=$HOME/.Xresources
#sysresources=/etc/X11/xinit/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

# if [ -f $sysresources ]; then
#     xrdb -merge $sysresources
# fi

# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi

# if [ -f "$userresources" ]; then
#     xrdb -merge "$userresources"
# fi

# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# terminal for graphical environment, we use urxvtd daemon
export TERMINAL=urxvtc

# keyboard speed
xset r rate 230 30

# swap esc and cap locks (macbook air)
#setxkbmap fr bepo
#setxkbmap -option caps:swapescape
setxkbmap -option caps:swapescape fr bepo

# desktop wallpaper and color
# xsetroot -solid "#073642"
/usr/bin/feh --bg-scale --no-fehbg ~/images/wallpapers/wallpaper.jpg

# daemon mode for urxvtd, recommanded here instead of systemd
/usr/bin/urxvtd -o -q -f
#/usr/bin/udiskie -T -q --no-notify --use-udisks2 &

exec i3
