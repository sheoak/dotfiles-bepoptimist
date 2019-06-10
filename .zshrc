# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# custom alias in :
# ~/.oh-my-zsh/custom/plugins/common-aliases/
# ~/.oh-my-zsh/custom/plugins/bepoptimist/

# local and private dotfiles path
export DOTFILES_PRIVATE=$HOME/.dotfiles-private
export DOTFILES_LOCAL=$HOME/.dotfiles-local
export DOTFILES_REPOSITORY=$HOME/.cfg

plugins=(
  git
  git-extras
  gitfast       # fixes completion for bare repositories
  colorize
  vi-mode
  fzf
  z
)

PRIVATE_PLUGINS=$DOTFILES_PRIVATE/zshrc.plugins
[[ -s "$PRIVATE_PLUGINS" ]] && source "$PRIVATE_PLUGINS"

ZSH_DISABLE_COMPFIX="true" # bug with completion security check
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_RIGHT_B="none"
HISTFILE=~/.local/share/zsh/zsh_history
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

ZSH_CUSTOM=$DOTFILES_PRIVATE/oh-my-zsh/

export UPDATE_ZSH_DAYS=7
export KEYTIMEOUT=1     # faster vim transitions

# Paths
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/.local/share/npm/lib/node_modules"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

# Dirty hack to fix /usr/bin/node that is not a directory
export PATH=$(echo "$PATH" | sed -e 's/:\/usr\/bin\/node//')

# Default executable
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser

# use lesspipe
export LESSOPEN="|lesspipe.sh %s"
export LESS='-R '

# no less history
export LESSHISTFILE=/dev/null

# fix ssh issues with kitty
if [ "$TERM" != 'linux' ]; then
  export TERM=xterm-256color
fi

# FZF settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --ignore-file ~/.ignore --hidden '
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_COMMAND='rg --files --no-ignore-vcs --ignore-file ~/.ignore --hidden '
export FZF_DEFAULT_OPTS='--inline-info --prompt="❯"'

# export GDK_BACKEND=wayland
# export CLUTTER_BACKEND=wayland
# export QT_QPA_PLATFORM=wayland-egl
# export QT_WAYLAND_FORCE_DPI=physical
export MONITOR='eDP-1'
export MONITOR_EXT='HDMI-1'

# export MOZ_ENABLE_WAYLAND=1

# GPG settings
export GPG_TTY=`tty`
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1

# Python virtualenvwrapper, lazy loading because it slows down loading
export WORKON_HOME=~/.virtualenvs
source virtualenvwrapper_lazy.sh

setopt menu_complete

# bindings
bindkey '^F' fzf-cd-widget
bindkey '^[[Z' reverse-menu-complete

source $ZSH/oh-my-zsh.sh

# colors for tty (gruvbox modified with darker background)
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0080808" # S_base02
    echo -en "\e]P1cc241d" # S_red
    echo -en "\e]P298971a" # S_green
    echo -en "\e]P3d79921" # S_yellow
    echo -en "\e]P4458588" # S_blue
    echo -en "\e]P5b16286" # S_magenta
    echo -en "\e]P6689d6a" # S_cyan
    echo -en "\e]P7a89984" # S_base2
    echo -en "\e]P8928374" # S_base03
    echo -en "\e]P9fb4934" # S_orange
    echo -en "\e]PAb8bb26" # S_base01
    echo -en "\e]PBfabd2f" # S_base00
    echo -en "\e]PC83a598" # S_base0
    echo -en "\e]PDd3869b" # S_violet
    echo -en "\e]PE8ec07c" # S_base1
    echo -en "\e]PFebdbb2" # S_base3
    clear # against bg artifacts
fi

# local settings
[[ -s $DOTFILES_PRIVATE/zshrc ]] && source "$DOTFILES_PRIVATE/zshrc"
[[ -s $DOTFILES_LOCAL/zshrc ]] && source "$DOTFILES_LOCAL/zshrc"
[[ -s $DOTFILES_LOCAL/zshrc.local ]] && source "$DOTFILES_LOCAL/zshrc.local"

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

alias vi=nvim

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
