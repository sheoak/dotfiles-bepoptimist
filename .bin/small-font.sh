#! /bin/sh
#
# small-font.sh
# set urxvt font-size

[ ! -z $1 ] && size=$1 || size=15
printf '\33]50;%s\007' "xft:DejaVu Sans Mono for Powerline:pixelsize=$size"
