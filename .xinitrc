#!/bin/sh
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysmodmap=/etc/X11/xinit/.Xmodmap

# privoxy
export http_proxy="http://localhost:8118"
export EDITOR=vim
export VISUAL=vim
export TERMINAL=urxvtc

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

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

# keyboard speed
xset r rate 230 30

# swap esc and cap locks (macbook air)
setxkbmap fr bepo
setxkbmap -option caps:swapescape

# desktop wallpaper and color
xsetroot -solid "#073642"
/usr/bin/feh --bg-scale ~/images/wallpapers/wallpaper.jpg

# daemon mode for urxvtd, recommanded here instead of systemd
/usr/bin/urxvtd -o -q -f

exec i3
