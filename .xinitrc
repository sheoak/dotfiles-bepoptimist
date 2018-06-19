#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# terminal for graphical environment, we use kitty
export TERMINAL=kitty

# keyboard speed
xset r rate 260 52

# mouse speed
xinput --set-prop 'ELAN1201:00 04F3:3098 Touchpad' 'libinput Accel Speed'  0.8

# swap esc and cap locks (macbook air)
setxkbmap -option caps:swapescape fr bepo

# desktop wallpaper and color
/usr/bin/feh --bg-scale --no-fehbg ~/images/wallpapers/zelda2.jpg

# redshift/dunst autostart fail because X is not ready yet
#redshift
systemctl --user import-environment DISPLAY
/usr/bin/dunst &

# daemon mode for urxvtd, recommanded here instead of systemd
#/usr/bin/udiskie -T -q --no-notify --use-udisks2 &
/usr/bin/compton -b

exec i3
