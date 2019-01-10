#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

# local system configuration
if [ -f ~/.xinitrc.local ]; then
    source ~/.xinitrc.local
fi

# terminal for graphical environment, we use kitty
export TERMINAL=kitty

# keyboard speed
xset r rate 280 56

# swap esc and cap locks (macbook air)
#setxkbmap -option caps:swapescape -option crtl:nocaps fr bepo

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps fr bepo

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# desktop wallpaper and color, put it in .xinitrc.local
#/usr/bin/feh --bg-fill --no-fehbg --randomize ~/images/wallpapers/*

# notifications
systemctl --user start dunst
systemctl --user import-environment DISPLAY

/usr/bin/udiskie -T -q --no-notify --use-udisks2 &

#exec i3 -d all > ~/i3.log
exec i3
