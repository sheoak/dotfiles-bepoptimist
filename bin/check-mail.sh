#! /bin/bash
shopt -s nullglob
WHERE=(~/.mail/*/Inbox/new/*)

COUNT=${#WHERE[@]}

if [[ $COUNT -gt 0 ]]; then
    echo " $COUNT"
else
    echo ""
fi
