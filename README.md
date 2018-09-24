The bépo keyboard addict dotfiles repository
============================================

Various linux configuration files — lot of them using bépo layout and/or 
vim-styles shortcuts.

This is a keyboard oriented configuration based on i3 (currently testing 
sway/wayland).

Most of the work on bépo configuration is made in my 
[vim-bepoptimist](https://github.com/sheoak/vim-bepoptimist) plugin.
I'm still experiencing a lot on it, it might be unstable. Any participation is 
welcome if you're a bépo enthousiast.


# Tip

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


# Bepo keyboard oriented configurations:

- mpv
- ncmpcpp
- kitty terminal
- less
- rtorrent
- zathura
- feh
- ranger
- qutebrowser
- i3 window manager
- screen
- neovim (see my plugin [vim-bepoptimist](https://github.com/sheoak/vim-bepoptimist)
- plugin)
- neomutt (see ~/.mutt/bepo.muttrc)


# Standard configuration files for:

- X
- asound
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


# Dropped support

I'm leaving those files but will not maintain them anymore:

- vimium
- vimb
- urxvt
- xcolors


# Tips

Nice way to store your dotfiles:
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
