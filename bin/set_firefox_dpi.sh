#! /bin/sh
PERPIX=$1
PATH=/home/sheoak/.mozilla/firefox/29qp7lok.Sheoak/user.js
/usr/bin/sed -E -i  "s/(layout\.css\.devPixelsPerPx.+)(\"[0-9]\")/\1\"$PERPIX\"/g" $PATH
