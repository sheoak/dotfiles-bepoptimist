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

ln -s $DOTFILES/.lesskey            $HOME/
lesskey

ln -s $DOTFILES/.config/ranger      $HOME/.config/
ln -s $DOTFILES/.config/zathura/    $HOME/.config/
ln -s $DOTFILES/.config/nvim        $HOME/.config/
ln -s $DOTFILES/.config/qutebrowser $HOME/.config/
ln -s $DOTFILES/.config/kitty       $HOME/.config/

ln -s $DOTFILES/bin                 $HOME/bin

if [ ! -d $HOME/.oh-my-zsh ];
then
    # warning, check repo first!
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone git://github.com/sheoak/zsh-bepoptimist.git ~/.oh-my-zsh/custom/plugins/bepoptimist
fi
chsh -s /bin/zsh

# change default npm path to avoid running as root
npm config set prefix ~/.local/share/npm
npm install -g jshint csslint pleeease-cli sass less pug pug-cli html2pug

# for vim (sass-convert)
gem install sass

# for vim-deoplete
sudo pip3 install neovim

# TODO: clone private repository plugins (custom)

cd -
