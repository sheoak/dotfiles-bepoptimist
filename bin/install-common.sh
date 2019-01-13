#! /bin/sh
#
# install-common.sh
# Copyright (C) 2015 Sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.

# you should run this script after installing all the dotfiles

if [ ! -d $HOME/.oh-my-zsh ];
then
    # warning, check repo first!
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone git://github.com/sheoak/zsh-bepoptimist.git ~/.oh-my-zsh/custom/plugins/bepoptimist
fi

chsh -s /bin/zsh

lesskey

# change default npm path to avoid running as root
npm config set prefix ~/.local/share/npm
npm install -g jshint csslint pleeease-cli sass less pug pug-cli html2pug svgo

# for vim (sass-convert)
gem install sass

# for vim-deoplete
pip3 install --user neovim
pip2 install --user neovim
