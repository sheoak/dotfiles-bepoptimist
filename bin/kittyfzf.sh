#! /bin/sh
FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --ignore-file $DOTFILES_PRIVATE/agignore'
FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --theme=TwoDark --color=always {} | head -100' --inline-info --reverse --prompt='❯' --preview-window='right:50%' --bind '?:toggle-preview'"

[ -z $1 ] || cd "$1"
xdotool search --onlyvisible --classname KittyFuzzy windowunmap \
  || xdotool search --classname KittyFuzzy windowmap \
  || kitty --name KittyFuzzy --detach -o font_size=9 -e sh -c 'kitty --detach -e -c sh nohup xdg-open "$(fzf)" > /dev/null 2>&1'
