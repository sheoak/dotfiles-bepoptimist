# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# custom alias in :
# ~/.oh-my-zsh/custom/plugins/common-aliases/
# ~/.oh-my-zsh/custom/plugins/bepoptimist/

plugins=(
  git
  git-extras
  gitfast       # fixes completion for bare repositories
  colorize
  vi-mode
  fzf
  z
  virtualenvwrapper
)

PRIVATE_PLUGINS=$DOTFILES_PRIVATE/zshrc.plugins
[[ -s "$PRIVATE_PLUGINS" ]] && source "$PRIVATE_PLUGINS"

ZSH_DISABLE_COMPFIX="true" # bug with completion security check

# custom theme
# (the plugin is included in private file)
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='15'
POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD='20'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_DISABLE_RPROMPT=true
VIRTUAL_ENV_DISABLE_PROMPT=1
POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs background_jobs disk_usage battery)
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='cyan'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_FOLDER_BACKGROUND='cyan'
POWERLEVEL9K_DIR_FOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_ETC_BACKGROUND='cyan'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='purple'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='black'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_ICON=''
POWERLEVEL9K_VCS_UNSTAGED_ICON=''
POWERLEVEL9K_BACKGROUND_JOBS_ICON=''
POWERLEVEL9K_BATTERY_ICON=''
POWERLEVEL9K_VCS_STASH_ICON='  '
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=' '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=' '
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''

HYPHEN_INSENSITIVE="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_RIGHT_B="none"
HISTFILE=~/.local/share/zsh/zsh_history

ZSH_CUSTOM=$DOTFILES_PRIVATE/oh-my-zsh/

export UPDATE_ZSH_DAYS=7
export KEYTIMEOUT=1     # faster vim transitions

# Paths
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.local/bin"
export PATH="$PATH:$DOTFILES_PRIVATE/bin:$HOME/.local/share/npm/bin"
export PATH="$PATH:$DOTFILES_LOCAL/bin"
export NODE_PATH="$NODE_PATH:$HOME/.local/share/npm/lib/node_modules"
export JAVA_HOME="/usr/lib/jvm/java-12-openjdk"
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Dirty hack to fix /usr/bin/node that is not a directory
export PATH=$(echo "$PATH" | sed -e 's/:\/usr\/bin\/node//')

# Default executable
# export EDITOR=nvim
# export VISUAL=nvim
export BROWSER=firefox

# use lesspipe
export LESSOPEN="|lesspipe.sh %s"
export LESS='-R '

# no less history
export LESSHISTFILE=/dev/null

# fix ssh issues with kitty
if [ "$TERM" != 'linux' ]; then
  export TERM=xterm-256color
else
  POWERLEVEL9K_IGNORE_TERM_COLORS=true
  POWERLEVEL9K_MODE='Powerlevel9k'
fi

# FZF settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --ignore-file $DOTFILES_PRIVATE/agignore --hidden '
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_CTRL_R_OPTS=""
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --theme=TwoDark --color=always {} | head -100' --preview-window='right' --bind 'ctrl-b:toggle-preview'"
export FZF_CTRL_T_COMMAND='rg --files --no-ignore-vcs --ignore-file $DOTFILES_PRIVATE/agignore --hidden '
export FZF_DEFAULT_OPTS="--inline-info --reverse --prompt='❯' --preview 'bat --style=numbers --theme=TwoDark --color=always {} | head -100' --preview-window='right:50%:hidden' --bind '?:toggle-preview'"

# bepo alias to z
alias é="z"

# export MOZ_ENABLE_WAYLAND=1

# GPG settings
export GPG_TTY=`tty`
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1

# Use bat for man
export MANPAGER="sh -c 'col -bx | bat --theme="TwoDark" -l man -p'"
# MANROFFOPT="-c"

# Python virtualenvwrapper, lazy loading because it slows down loading
export WORKON_HOME=~/.virtualenvs
source virtualenvwrapper_lazy.sh

setopt menu_complete

# bindings
bindkey '^F' fzf-cd-widget
bindkey '^[[Z' reverse-menu-complete

source $ZSH/oh-my-zsh.sh

# local settings
[[ -s $DOTFILES_PRIVATE/zshrc ]] && source "$DOTFILES_PRIVATE/zshrc"
[[ -s $DOTFILES_LOCAL/zshrc ]] && source "$DOTFILES_LOCAL/zshrc"
[[ -s $DOTFILES_LOCAL/zshrc.local ]] && source "$DOTFILES_LOCAL/zshrc.local"

# startx if on tty1
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &>/dev/null
fi
