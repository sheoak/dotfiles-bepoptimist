#! /bin/sh
#
# install.sh
# Copyright (C) 2015 sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.
#
# Install repo dependencies, using apt-get
#
# be sure to run install-dev.sh first for dependencies

cd `dirname $0`
DOTFILES="`pwd`"

if [ ! -d ~/.vim/bundle/Vundle.vim/ ];
then
    # vundle install
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# link spell files
mkdir -p $HOME/.vim/spell/
ln -s $DOTFILES/.vim/spell/* $HOME/.vim/spell/

# install vundle plugins
vim +PluginInstall +qall

cd -

# make YouComplete plugin
cd ~/.vim/bundle/YouCompleteMe/
./install.sh
cd -

# make vimproc plugin
cd ~/.vim/bundle/vimproc.vim/
make
cd -

echo "Do not forget to install tidy5 and put 'tidy' in PATH: https://github.com/htacg/tidy-html5"

