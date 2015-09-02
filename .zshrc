# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode git-flow github gitignore git-extras gpg-agent adb cp)

#POWERLINE_RIGHT_B="date replacement"
POWERLINE_RIGHT_B="none"
#POWERLINE_DISABLE_RPROMPT="true"
POWERLINE_DETECT_SSH="true"
#POWERLINE_HIDE_USER_NAME="true"
#POWERLINE_HIDE_HOST_NAME="true"

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$PATH:$HOME/npm/bin:$HOME/bin"
#export PATH="$PATH:$HOME/npm/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/sbin:$HOME/Scripts"
#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
alias itconfig="vim ~/.i3/config"
alias viconfig="vim ~/.vimrc"
alias synergystart="nohup synergys -f -c /etc/synergy.conf > ~/.synergy.out 2> /dev/null &"

alias p="less ~/.post-it"
alias pe="vim ~/.post-it"

alias gc="git commit -am $1"
alias gp="git push -u origin master"

alias restartaudio="pulseaudio -k && sudo alsa force-reload"
alias xm="xmodmap ~/.Xmodmaprc"

alias feh='feh -B black -FZx '
alias ll='ls --color -lh --group-directories-first'

function removeignore()
{
    git rm --cached $(git ls-files -i -X .gitignore)
}

function livraison() {
    version=`echo $1 | sed 's/livraison-//' | sed 's/-.*//'`
    reg='^[0-9]+$'

    if ! [[ $version =~ $reg ]]; then
        echo 'No version found'
        return
    fi

    version=$((version + 1))

    # TODO: use tar
    git diff --name-only $1 | zip ../livraison-$version-`date +%Y-%m-%d` -@
    echo "Don’t forget to create tag (git tag livraison-$version-`date +%Y-%m-%d`)"
}

bindkey '^R' history-incremental-search-backward
setopt menu_complete

EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
SUDO_EDITOR=/usr/bin/vim

export SUDO_EDITOR

[[ -s $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"
