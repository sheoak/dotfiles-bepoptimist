#! /bin/bash

shopt -s nullglob
WHERE=(~/.msmtpqueue/*.mail)
COUNT=${#WHERE[@]}

if [[ $COUNT -gt 0 ]]; then
    echo "msmtp queue: $COUNT"
else
    echo ""
fi
