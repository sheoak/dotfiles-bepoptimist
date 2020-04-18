#! /bin/sh
xdotool search --onlyvisible --classname KittyFuzzy windowunmap \
  || xdotool search --classname KittyFuzzy windowmap \
  || kitty --name KittyFuzzy --detach -e sh -c 'kitty --single-instance -e -c sh xdg-open $(fzf --color=bw)'
