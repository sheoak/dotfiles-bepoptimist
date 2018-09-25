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

# vim-plug install
if [ ! -d ~/.local/share/nvim/site/autoload/plug.vim/ ];
then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# create backups dir
mkdir -p ~/.local/share/nvim/{backups,undo,swap}

# install vundle plugins
nvim +PlugInstall +qall
nvim +UpdateRemotePlugin +qall

cd -

echo "Do not forget to install tidy5 and put 'tidy' in PATH: https://github.com/htacg/tidy-html5"

