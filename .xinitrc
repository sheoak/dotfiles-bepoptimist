#!/bin/sh

export MONITOR='eDP-1'
export MONITOR_EXT='HDMI-1'

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# TODO: use private dotfiles
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

# Local Xresource (mainly monitor/dpi settings)
if [ -f $DOTFILES_LOCAL/Xresources ]; then
    xrdb -merge $DOTFILES_LOCAL/Xresources
fi

# local system configuration
if [ -d $DOTFILES_LOCAL ] ; then
    shopt -s nullglob
    for f in ${DOTFILES_LOCAL}/xinitrc*; do
        source "$f"
    done
    unset f
fi

# terminal for graphical environment, we use kitty
export TERMINAL=kitty
export QT_STYLE_OVERRIDE=adwaita

# keyboard speed
xset r rate 280 56

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps fr bepo

# xautolock should be attached to x, not i3 or systemd
xautolock -time 30 -locker "physlock" -notify 20 -notifier "xset dpms force off" &
xcape -e 'Control_L=Escape'

# transparency
compton -b

# wallpaper
feh --bg-scale ~/images/wallpaper.jpg

exec i3
