#! /bin/sh
# create a new terminal and execute the given command, adding a mark to the
# window and a title

# usage: urxvt-i3.sh <app-command>
/usr/bin/urxvt -title "$1" -e sh -c "i3-msg mark $1 && $1"
