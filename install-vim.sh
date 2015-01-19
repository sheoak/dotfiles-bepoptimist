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
    echo "You must install vundle first https://github.com/gmarik/Vundle.vim"
    echo "Installation cancelled"
    exit
fi

sudo apt-get install silversearcher-ag cmake git nodejs npm
sudo npm install -g sass jshint

# install vundle plugins
vim +PluginInstall +qall

# make YouComplete plugin
cd ~/.vim/bundle/YouCompleteMe/
./install.sh

# make vimproc plugin
cd ~/.vim/bundle/vimproc.vim/
make


