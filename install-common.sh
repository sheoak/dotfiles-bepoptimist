#! /bin/sh
#
# install-common.sh
# Copyright (C) 2015 Sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.

# TODO: i3 config + include local

cd `dirname $0`
DOTFILES="`pwd`"

# TODO
# ln -s $DOTFILES/bin $HOME/bin
ln -s $DOTFILES/.Xdefaults $HOME/
ln -s $DOTFILES/.zshrc $HOME/
ln -s $DOTFILES/.config/ranger $HOME/.config/
ln -s $DOTFILES/.zathura/ $HOME/
ln -s $DOTFILES/.xcolors $HOME/
ln -s $DOTFILES/.ncmpcpp $HOME/
ln -s $DOTFILES/.conkyrc $HOME/
ln -s $DOTFILES/.vimrc $HOME/
ln -s $DOTFILES/.vimrc.bepo.keymap $HOME/
ln -s $DOTFILES/.vimrc.typematrix.keyboard $HOME/
#deprecated, i keep it here for people who still use it…
#ln -s $DOTFILES/.vimperatorrc $HOME/
ln -s $DOTFILES/.vimiumrc $HOME/

if [ ! -d $HOME/.oh-my-zsh ];
then
    # warning, check repo first!
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    chsh -s /bin/zsh
fi
chsh -s /bin/zsh

# Python configuration
sudo pip install virtualenvwrapper

ln -s /usr/bin/virtualenvwrapper.sh $HOME/.local/bin

cd -
