#! /bin/sh
#
# install.sh
# Copyright (C) 2015 sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.
#
# Install repo dependencies, using apt-get
if [ ! -d ~/.vim/bundle/Vundle.vim/ ];
then
    # vundle install
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

sudo apt-get install silversearcher-ag cmake git nodejs npm vim-common python-dev
sudo npm install -g sass jshint

# install vundle plugins
vim +PluginInstall +qall

# make YouComplete plugin
cd ~/.vim/bundle/YouCompleteMe/
./install.sh

# make vimproc plugin
cd ~/.vim/bundle/vimproc.vim/
make


