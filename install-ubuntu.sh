#! /bin/sh
#
# install-system.sh
# Copyright (C) 2015 sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.

sudo apt-get update

sudo apt-get install -y \
     build-essential \
     build-essential \
     chromium-browser \
     conky \
     console-data \
     feh \
     filezilla \
     gimp \
     git \
     git-flow \
     gnome-icon-theme-full \
     htop \
     i3 \
     mongodb \
     mpd \
     msmtp \
     msmtp-gnome \
     mutt \
     ncmpcpp \
     nodejs \
     npm \
     offlineimap \
     python-dev \
     python3 \
     ruby-full \
     silversearcher-ag \
     subversion \
     thunar \
     thunar-archive-plugin \
     ubuntu-restricted \
     ubuntu-restricted-extras \
     unrar \
     unzip \
     urxvt-unicode \
     vim-common \
     weechat \
     zathura

# ranger
sudo apt-get install -y \
    atool \
    caca-utils \
    highlight \
    mediainfo \
    poppler-utils \
    ranger \
    w3m

# LAMP
sudo apt-get install -y \
     apache2 \
     libapache2-mod-php5 \
     mysql-server \
     php5 \
     php5-curl \
     php5-mysql \
     phpmyadmin

sudo apt-get remove nano

a2enmod headers rewrite

# FIXME zathura bug if not in etc?
sudo cp /etc/zathurarc /etc/zathurarc.bak
sudo cp .zathura/zathurarc /etc/zathurarc

sudo update-alternatives --config x-terminal-emulator

source `dirname $0`/install-common.sh
