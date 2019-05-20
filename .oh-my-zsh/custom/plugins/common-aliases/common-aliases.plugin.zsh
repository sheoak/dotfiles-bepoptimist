# Advanced Aliases.
# Use with caution
#
# Customized version

# ls, the common ones I use a lot shortened for rapid fire usage
alias ls="ls --color --group-directories-first -Nh"
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

# custom
alias -g C='| xclip -selection clipboard'

alias df="df -h"
alias du="du -h"
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias whereami=display_info

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

  #read documents
  alias -s pdf=zathura
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

alias sudo="sudo -E "
alias ducks='du -cks * | sort -rn | head'
alias yank='xclip -selection clipboard'
alias feh='feh -B black -FZx '
alias itconfig="vim ~/.config/i3/config"
alias viconfig="vim ~/.vimrc"
alias pacin='sudo pacman -S'

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacsearch='sudo pacman -Ss'
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacre='sudo pacman -R'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacmir='sudo pacman -Syy'

# run offlineimap service before mutt
alias mutt=neomutt

# set an ad-hoc GUI timer
function timer() {
  local N=$1; shift

  (sleep $N && notify-send "${*:-BING}" && mpc play) &
  echo "timer set for $N"
}
function trash() { mv "$@" ~/.trash/; }
function bak() { mv "$@" ~/.backups/; }
alias trash-clear='rm -rf ~/.trash/*'
alias automount='/usr/bin/udiskie -T -q --no-notify --use-udisks2 &'

# migration to nvim
alias vi=nvim
alias vim=nvim

alias usys='systemctl --user '
alias ytmp3='youtube-dl -x --audio-format mp3 -o "%(title)s.%(ext)s" '
alias youtube-dl='youtube-dl --audio-format ogg --audio-quality 7 --prefer-free-formats --restrict-filenames '
alias youtube-quickdl="youtube-dl --audio-quality 7 --prefer-free-formats --restrict-filenames -o '~/videos/youtube/%(title)s.%(ext)s' "

# project manager
# https://github.com/eivind88/prm
alias pm='. ~/bin/vendor/prm/prm.sh'
alias pms='pm start '
alias pmq='pm stop '
alias z='zathura'

# dotfiles managment shortcuts
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias c='config'
alias cst='config status'
alias cadd='config add '
alias cpatch='config add -p '
alias cpush='config push '
alias cpull='config pull '
alias ccommit='config commit'

alias vl='vim -c ":Denite file_mru -immediately"'
alias v='vim -c ":Denite file_mru"'
alias s='screen'
alias sr='screen -r'
alias p='pass '
alias pg='pass git '

alias m='./manage.py '
alias da='django-admin '
alias mshell='./manage.py shell_plus --bpython'

alias sc='systemctl '
alias scr='systemctl restart '
alias scs='systemctl start '
alias sch='systemctl stop '
alias scu='systemctl --user '
alias scur='systemctl --user restart '
alias scus='systemctl --user start '
alias scuh='systemctl --user stop '

alias wo='workon '
alias pi='pip install '
alias pir='pip uninstall '
alias piu='pip install --user '
alias piup='pip install --upgrade'

# translations:
alias enfr='trans en:fr '
alias fren='trans fr:en '
alias enjp='trans en:ja '
alias dicfr='trans -d :fr '
alias dicen='trans -d :en '
alias dicja='trans -d :ja '

alias f='fzf '

alias finddup='find -name "*.*" -print0 | xargs -0 md5sum | sort | uniq -Dw 32'
alias flac2mp3='parallel ffmpeg -i {} -qscale:a 0 {.}.mp3 ::: ./*.flac'
