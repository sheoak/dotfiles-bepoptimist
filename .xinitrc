#!/bin/bash

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# base Xressources, standard DPI
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

# local system configuration
if [ -d "$DOTFILES_LOCAL" ] ; then
    shopt -s nullglob
    for f in "${DOTFILES_LOCAL}"/xinitrc*; do
        source "$f"
    done
    unset f
fi

# keyboard speed
(sleep 3 && xset r rate 200 80) &

# make CapsLock behave like Ctrl:
(sleep 3 && xcape -e 'Control_L=Escape') &

# xautolock should be attached to x, not i3 or systemd
xautolock -time 120 -locker "systemctl suspend" -notify 20 -notifier "xset dpms force off" &

# transparency
picom -b

# startup
# TODO: service
/usr/bin/caffeine
/usr/bin/seafile

/usr/bin/setterm -blank 1 -powersave powerdown

exec i3
