#! /bin/sh
#
# install-system.sh
# Copyright (C) 2015 sheoak <dev@sheoak.fr>
#
# Distributed under terms of the MIT license.
# vars
cd `dirname $0`
DOTFILES="`pwd`"

sudo pacman -Syu

sudo pacman -S \
    alsa-oss \
    alsa-utils \
    atool \
    chromium \
    cmake \
    conky \
    dmenu \
    elinks \
    feh \
    filezilla \
    firefox \
    firefox-i18n-fr \
    git \
    gnupg \
    gtk2 \
    gtk3 \
    gvim-python3 \
    htop \
    i3 \
    mediainfo \
    mongodb \
    mpd \
    mplayer \
    msmtp \
    mutt \
    ncmpcpp \
    nodejs \
    npm \
    offlineimap \
    owncloud-client \
    pulseaudio \
    python3 \
    ranger \
    rfkill \
    ruby \
    rxvt-unicode \
    seahorse \
    silversearcher-ag \
    thunar \
    transmission-gtk \
    udiskie \
    udisks2 \
    unrar \
    unzip \
    urxvt-perls \
    vagrant \
    vlc \
    w3m \
    weechat \
    zathura \
    zathura-pdf-poppler \
    zsh

# LAMP
sudo pacman -S \
     apache \
     mariadb \
     php \
     php-apache

# adminer
cd /tmp
git clone https://aur.archlinux.org/adminer.git
cd adminer
makepkg -s && sudo pacman -U adminer-*.tar.xz

# urxvt perl scripts
cd /tmp
git clone https://aur.archlinux.org/urxvt-resize-font-git
cd /tmp/urxvt-resize-font-git
makepkg -s && sudo pacman -U urxvt*.tar.xz

sudo pacman -R nano

#a2enmod headers rewrite

# mutt, offlineimap, gpg…
# add zlogin for arch + xinitrc

# DAEMONS

# network
sudo systemctl disable networkd
sudo systemctl enable connman && sudo systemctl start connman
# lamp
sudo systemctl enable mysqld && sudo systemctl start mysqld
sudo systemctl enable httpd && sudo systemctl start httpd
# automount usb
sudo systemctl enable ldm && sudo systemctl start ldm

# link system specific dotfiles
# .profile
# keyboard xorg

# link computer specific dotfiles
# xorg.conf
sudo tee /sys/class/backlight/acpi_video0/brightness <<< 10

# default apps
xdg-mime default chromium.desktop x-scheme-handler/http
xdg-mime default chromium.desktop x-scheme-handler/https

# arch specific dotfiles
ln -s $DOTFILES/arch/.zlogin $HOME/
ln -s $DOTFILES/arch/.xinitrc $HOME/
ln -s $DOTFILES/arch/.config/user-dirs.dirs $HOME/.config/

source `dirname $0`/install-common.sh

cd -
