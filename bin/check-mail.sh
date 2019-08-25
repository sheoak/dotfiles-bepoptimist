#! /bin/bash
shopt -s nullglob
WHERE=(~/.mail/*/Inbox/new/*)
COUNT=${#WHERE[@]}
CHECK_SERVICE=`systemctl is-active --user mbsync.service`
OUT=""
COLOR_ERR="%{F#dc322f}%{F-}"

if [[ $COUNT -gt 0 ]]; then
    OUT=" $COUNT"
else
    OUT=""
fi

if [[ $CHECK_SERVICE = 'failed' ]]; then
    [[ -z $OUT ]] && OUT=" %{F#dc322f}mbsync error%{F-}" || OUT="$OUT %{F#dc322f}[mbsync error]%{F-}"
fi

echo $OUT
