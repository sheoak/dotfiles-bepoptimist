The bépo keyboard addict dotfiles repository
============================================

# Introduction

Various Linux configuration files — lot of them using bépo layout and/or 
vim-styles shortcuts. This is a keyboard oriented configuration based on i3 
(currently testing sway/wayland).


# Caution

This repository is currently under refactoring and unstable.
Use at your own risk. I'm aiming at making a stable version before the end of 
the year and will the follow a standard git workflow.

# The goal

I aim to make all configuration files generic, with external files for local and 
private settings. You can find an exemple of local settings on my repository for 
the 
[mid-2011 macbook air](https://github.com/sheoak/dotfiles-macbook-air-mid-2011).

A lot effort is put on minimalist maintenance and installation time. All my 
machine are using this same repository without any differences. Most 
of the customization happen in the $DOTFILES_PRIVATE and $DOTFILES_LOCAL 
directories.

- ~/.dotfiles-private : custom config that should not be public
- ~/.dotfiles-local   : local settings for the current host (monitor settings, 
  themes…)

I am working on a way to install everything automatically using ansible and will 
share the source code when it's done.

Most of the work on bépo configuration is made in my 
[vim-bepoptimist](https://github.com/sheoak/vim-bepoptimist) plugin.
I'm still experiencing a lot on it, it might be unstable. Any participation is 
welcome if you're a bépo enthusiast.


# Installation

You can easily install it by forking it and then using 
[this method explained on atlassian.com](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).
In short:

    $ cd ~
    # the following alias is included in ~/.zshrc
    $ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    $ echo ".cfg" >> .gitignore
    $ config checkout

If you get errors, backup and start again

    $ mkdir -p .config-backup && \
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}
    $ config checkout

Some settings:

    $ config config --local status.showUntrackedFiles no

You can now do for example:

    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .bashrc
    config commit -m "Add bashrc"
    config push


# Bépo keyboard oriented configurations:

- feh
- i3 window manager
- kitty terminal
- less
- mpv
- ncmpcpp
- neomutt (see ~/.mutt/bepo.muttrc)
- neovim (see my plugin [vim-bepoptimist](https://github.com/sheoak/vim-bepoptimist)
- oh-my-zsh
- qutebrowser
- ranger
- rtorrent
- screen
- vimium
- zathura


# Standard configuration files for:

- X
- gnupg
- ssh
- gtk 2/3
- zsh (oh-my-zsh)
- offlineimap (sample)
- msmtp (sample)
- neovim
- neomutt (support for rstandard mutt has been dropped)
- custom fonts, including powerline


# Work in progress

- sway/wayland
- install via ansible


# Dropped support

I'm leaving those files but will not maintain them anymore:

- vimb
- urxvt
- xcolors


# Tips

Nice way to store your dotfiles:
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
