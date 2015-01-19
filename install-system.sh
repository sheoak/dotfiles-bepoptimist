#! /bin/sh
#
# install-system.sh
# Copyright (C) 2015 sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.

apt-get update

sudo apt-get install -y
    \ urxvt-unicode
    \ nodejs
    \ npm
    \ git
    \ subversion
    \ build-essential
    \ ubuntu-restricted
    \ ubuntu-restricted-extras
    \ htop
    \ console-data
    \ chromium-browser
    \ filezilla
    \ ubuntu-restricted-extras
    \ ubuntu-restricted-addons
    \ build-essential
    \ gimp
    \ unrar
    \ htop
    \ thunar
    \ unzip
    \ thunar-archive-plugin
    \ vim-common
    \ nodejs
    \ ruby-full

# LAMP
sudo apt-get install -y
    \ apache2
    \ php5
    \ mysql-server
    \ libapache2-mod-php5
    \ php5-mysql
    \ phpmyadmin
    \ php5-curl

sudo gem install sass
sudo gem install compass
npm update
sudo npm install -g pleeease jshint sails

a2enmod headers rewrite


