#! /bin/sh
xdotool search --onlyvisible --classname KittyFuzzy windowunmap \
  || xdotool search --classname KittyFuzzy windowmap \
  || kitty --name KittyFuzzy --detach -e sh -c 'kitty --detach -e -c sh nohup xdg-open $(fzf --color=bw) > /dev/null 2>&1'
