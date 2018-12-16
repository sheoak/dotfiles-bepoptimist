
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  common-aliases
  bepoptimist
)

# bug with completion security check
ZSH_DISABLE_COMPFIX=true

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

export GPG_TTY=`tty`
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1

# privoxy
export http_proxy="http://localhost:8118"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.local/bin"

export EDITOR=nvim
export VISUAL=nvim

# for neomutt/urlscan
export BROWSER=qutebrowser

# use lesspipe
export LESSOPEN="|lesspipe.sh %s"
# no less history
export LESSHISTFILE=/dev/null

# custom node path
export PATH="$PATH:$HOME/.local/share/npm/bin:/usr/bin/node"
export NODE_PATH="$NODE_PATH:$HOME/.local/share/npm/lib/node_modules"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

POWERLINE_DETECT_SSH="true"
POWERLINE_RIGHT_B="none"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Solarized theme for tty, the dark version.
# Based on:
#   - Solarized (http://ethanschoonover.com/solarized)
#   - Xresources from http://github.com/altercation/solarized
# Generated with pty2tty.awk by Joep van Delft
# http://github.com/joepvd/tty-solarized
if [ "$TERM" = "linux" ]; then
    echo -en "\e]PB657b83" # S_base00
    echo -en "\e]PA586e75" # S_base01
    echo -en "\e]P0000C0F" # S_base02
    echo -en "\e]P62aa198" # S_cyan
    echo -en "\e]P8002b36" # S_base03
    echo -en "\e]P2859900" # S_green
    echo -en "\e]P5d33682" # S_magenta
    echo -en "\e]P1dc322f" # S_red
    echo -en "\e]PC839496" # S_base0
    echo -en "\e]PE93a1a1" # S_base1
    echo -en "\e]P9cb4b16" # S_orange
    echo -en "\e]P7eee8d5" # S_base2
    echo -en "\e]P4268bd2" # S_blue
    echo -en "\e]P3b58900" # S_yellow
    echo -en "\e]PFfdf6e3" # S_base3
    echo -en "\e]PD6c71c4" # S_violet
    clear # against bg artifacts
fi

# gruvbox colors from vim plugin
source ~/.local/share/nvim/plugged/gruvbox/gruvbox_256palette.sh

source $ZSH/oh-my-zsh.sh

# git bare repository dotfiles
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Python virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source ~/.local/bin/virtualenvwrapper.sh

# move history file in a cleaner place
HISTFILE=~/.local/share/zsh/zsh_history

# custom alias in :
# ~/.oh-my-zsh/custom/plugins/common-aliases/
# ~/.oh-my-zsh/custom/plugins/bepoptimist/

[[ -s $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"
