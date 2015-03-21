#! /bin/sh
#
# install-system.sh
# Copyright (C) 2015 sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.

sudo apt-get update

sudo apt-get install -y \
     urxvt-unicode \
     offlineimap \
     mpd \
     ncmpcpp \
     gnome-icon-theme-full \
     nodejs \
     zathura \
     npm \
     git \
     git-flow \
     subversion \
     build-essential \
     ubuntu-restricted \
     ubuntu-restricted-extras \
     htop \
     console-data \
     chromium-browser \
     filezilla \
     build-essential \
     gimp \
     unrar \
     thunar \
     unzip \
     thunar-archive-plugin \
     vim-common \
     ruby-full \
     conky \
     feh \
     mongodb \
     weechat \
     msmtp \
     msmtp-gnome \
     mutt

# ranger
sudo apt-get install -y \
    ranger \
    caca-utils \
    highlight \
    atool \
    w3m \
    poppler-utils \
    mediainfo

# LAMP
sudo apt-get install -y \
     apache2 \
     php5 \
     mysql-server \
     libapache2-mod-php5 \
     php5-mysql \
     phpmyadmin \
     php5-curl \

sudo apt-get remove nano

sudo gem install sass
sudo gem install compass
npm update
sudo npm install -g pleeease jshint sails

a2enmod headers rewrite

# FIXME zathura bug if not in etc?
sudo cp /etc/zathurarc /etc/zathurarc.bak
sudo cp .zathura/zathurarc /etc/zathurarc


git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

sudo update-alternatives --config x-terminal-emulator



