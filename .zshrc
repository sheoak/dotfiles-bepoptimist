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
  fz
  common-aliases
  bepoptimist
)

PRIVATE_PLUGINS=$DOTFILES_PRIVATE/zshrc.plugins
[[ -s "$PRIVATE_PLUGINS" ]] && source "$PRIVATE_PLUGINS"

ZSH_DISABLE_COMPFIX="true" # bug with completion security check
ZSH_THEME="multiline"
HYPHEN_INSENSITIVE="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_RIGHT_B="none"
HISTFILE=~/.local/share/zsh/zsh_history
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# ZSH_CUSTOM=$HOME/.oh-my-zsh-custom/

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

# no less history
export LESSHISTFILE=/dev/null

# fix ssh issues with kitty
export TERM=xterm-256color

# FZF settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --ignore-file ~/.ignore --hidden '
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_COMMAND='rg --files --no-ignore-vcs --ignore-file ~/.ignore --hidden '
export FZF_DEFAULT_OPTS='--inline-info --prompt="❯"'

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

# ----------------------------------------------------------------------------
# Theme
# ----------------------------------------------------------------------------

# we test first to avoid sourcing for nothing
source ~/.local/share/nvim/plugged/gruvbox/gruvbox_256palette.sh

# TODO: export in another file, use Xresources
# Solarized theme for tty, the dark version.
# Based on:
#   - Solarized (http://ethanschoonover.com/solarized)
#   - Xresources from http://github.com/altercation/solarized
# Generated with pty2tty.awk by Joep van Delft
# http://github.com/joepvd/tty-solarized
if [ "$TERM" = "xterm-256color" ]; then
    echo -en "\e]P0000C0F" # S_base02
    echo -en "\e]P1dc322f" # S_red
    echo -en "\e]P2859900" # S_green
    echo -en "\e]P3b58900" # S_yellow
    echo -en "\e]P4268bd2" # S_blue
    echo -en "\e]P5d33682" # S_magenta
    echo -en "\e]P62aa198" # S_cyan
    echo -en "\e]P7eee8d5" # S_base2
    echo -en "\e]P8002b36" # S_base03
    echo -en "\e]P9cb4b16" # S_orange
    echo -en "\e]PA586e75" # S_base01
    echo -en "\e]PB657b83" # S_base00
    echo -en "\e]PC839496" # S_base0
    echo -en "\e]PD6c71c4" # S_violet
    echo -en "\e]PE93a1a1" # S_base1
    echo -en "\e]PFfdf6e3" # S_base3
    clear # against bg artifacts
fi

# local settings
[[ -s $DOTFILES_LOCAL/zshrc ]] && source "$DOTFILES_LOCAL/zshrc"
[[ -s $DOTFILES_LOCAL/zshrc.local ]] && source "$DOTFILES_LOCAL/zshrc.local"

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin
