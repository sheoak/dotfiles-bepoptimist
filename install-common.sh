#! /bin/sh
#
# install-common.sh
# Copyright (C) 2015 Sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.

cd `dirname $0`
DOTFILES="`pwd`"

ln -s $DOTFILES/.zshrc              $HOME/
ln -s $DOTFILES/.ncmpcpp            $HOME/
ln -s $DOTFILES/.vimiumrc           $HOME/

ln -s $DOTFILES/.config/ranger      $HOME/.config/
ln -s $DOTFILES/.config/zathura/    $HOME/.config/
ln -s $DOTFILES/.config/nvim        $HOME/.config/

ln -s $DOTFILES/bin                 $HOME/bin

if [ ! -d $HOME/.oh-my-zsh ];
then
    # warning, check repo first!
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
chsh -s /bin/zsh

# TODO: clone private repository plugins (custom)

cd -
