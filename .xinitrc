#!/bin/sh

# export DOTFILES_PRIVATE=$HOME/.dotfiles-private
# export DOTFILES_LOCAL=$HOME/.dotfiles-local

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

# keyboard speed
xset r rate 280 56

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps fr bepo

# notifications
systemctl --user start dunst
systemctl --user import-environment DISPLAY

# transparency
compton -b

# wallpaper
feh --bg-scale ~/images/wallpaper.jpg

exec i3
