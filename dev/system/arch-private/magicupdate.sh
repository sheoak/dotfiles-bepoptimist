#!/bin/bash

# run chroot on live usb if equal 1
CHROOT=0
USER=zoan
# assume yes to questions
YES=0
GIT=1
# update git repos
ZSH=$HOME/.oh-my-zsh
ZSHUPDATE=1
# for live usb chroot
SCRIPTNAME=`basename "$0"`
SCRIPTPATH=~/dev/system/arch-private/$SCRIPTNAME
LIVEUUID=28957bf2-5801-486e-83ff-47d494396320
LIVEBOOTUUID=EB4A-4FD9
# nextcloud
CLOUDURL=https://cloud.lightn.es
CLOUDLOGIN=sheoak

KAGEMUSHAUUID=4c9e24cd-98fe-4a3e-a8da-88341eed64ae
PWD=$(pwd)

function config() {
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

if [ "$(whoami)" = 'root' ]; then
    echo "You must not run this script as root"
    exit 1
fi

# read options
TEMP=$(getopt -o c:gu:hyz --long chroot:,user:,help,yes,no-zsh-update,no-git -n "$SCRIPTNAME" -- "$@")
eval set -- "$TEMP"

# extract options and their arguments into variables.
while true ; do
    case "$1" in
        -h|--help)
            echo "Usage: $SCRIPTNAME [options]"
            echo
            echo "Option list:"
            echo "-c, --chroot          update live usb via chroot using configuration fil using configuration file"
            echo "-z, --no-zsh-update   disable zsh updates"
            echo "-y, --yes             assume yes to questions"
            exit
            ;;
        -c|--chroot)
            CHROOT=1;
            case "$2" in
                "") shift 2 ;;
                *) CHROOT_USER=$2 ; shift 2 ;;
            esac ;;
        -g|--no-git) GIT=0 ; shift ;;
        -u|--user)
            case "$2" in
                "") shift 2 ;;
                *) USER=$2 ; shift 2 ;;
            esac ;;
        -y|--yes) YES=1 ; shift ;;
        -z|--no-zsh-update) ZSHUPDATE=0 ; shift ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

# First checking the dotfiles to see if we wanna make any commit
if [ $GIT -eq 1 ];
then
    echo "Checking dotfiles state first:"
    config status

    if [ $YES -eq 0 ]; then
        while true; do
            read -p "Continue? Y/n" -n 1 -r
            echo
            case $REPLY in
                [Yy]*|"" ) break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi

    echo "Updating config…"
    config pull origin master
    config push origin master
fi

if [ $CHROOT -eq 1 ]; then

    echo "Updating live USB (chroot)…"

    if [[ $(sudo blkid  -U $LIVEUUID | wc -l) -eq 0 ]]
    then
        >&2 echo "No root partition with UUID $LIVEUUID found. Aborting."
        exit 1
    fi

    if [[ $(sudo blkid  -U $LIVEBOOTUUID | wc -l) -eq 0 ]]
    then
        >&2 echo "No boot partition with UUID $LIVEBOOTUUID found. Aborting."
        exit 1
    fi

    echo "Live USB found!"
    echo "Mounting live USB…"

    if [[ $(sudo mount | grep $LIVEUUID -c) -gt 0 ]]
    then
        >&2 echo "Live USB is already mounted. Aborting."
        exit 1
    fi
    if [[ $(sudo mount | grep $LIVEBOOTUUID -c) -gt 0 ]]
    then
        >&2 echo "Live USB boot partition is already mounted. Aborting."
    fi

    sudo mkdir /mnt/$LIVEUUID/
    sudo mount -U $LIVEUUID /mnt/$LIVEUUID

    sudo mkdir /mnt/$LIVEUUID/boot
    sudo mount -U $LIVEBOOTUUID /mnt/$LIVEUUID/boot

    echo "Updating live USB…"

    # magic update, no live usb detection (recursive)
    sudo arch-chroot /mnt/$LIVEUUID sudo -u "$CHROOT_USER" "$SCRIPTPATH" -y

    echo "Unmounting live USB…"
    sudo umount /mnt/$LIVEUUID/boot
    sudo umount /mnt/$LIVEUUID
    sudo rmdir /mnt/$LIVEUUID/boot
    sudo rmdir /mnt/$LIVEUUID

fi

# kagemusha backup key found
if [[ $(sudo blkid  -U $KAGEMUSHAUUID | wc -l) -eq 1 ]]
then
    if [[ $(mount | grep 'Kagemusha' -c) -eq 0 ]]
    then
        >&2 echo "Kagemusha was found but is not mounted. Skipping."
    else
        echo "Updating kagemusha password backup…"
        cd ~/.password-store || exit 1
        git push backup master
    fi
fi

if [[ $GIT -eq 1 ]];
then
    echo "Updating password store…"
    pass git pull
    pass git push
fi

if [[ $ZSHUPDATE -eq 1 ]];
then
    echo "Updating oh-my-zsh plugins…"
    cd ~/.oh-my-zsh/custom/plugins/bepoptimist/ && git pull origin master
    cd ~/.oh-my-zsh/custom/plugins/common-aliases/ && git pull origin master
    cd ~/.oh-my-zsh/custom/plugins/private-aliases/ && git pull origin master

    # echo "Upgrading oh-my-zsh" # already included in the tool
    env ZSH="$ZSH" sh "$ZSH/tools/upgrade.sh"
fi

[ $YES -eq 1 ] || read -p "Update nextcloud? (y/N)" -n 1 -r
echo
if [[ "$YES" -eq 1 ]] || [[ $REPLY =~ ^[Yy]$ ]];
then
    nextcloudcmd \
        --user $CLOUDLOGIN --password "$(pass cloud.lightn.es/sheoak | head -n 1)" \
        ~/cloud $CLOUDURL
fi

[ $YES -eq 1 ] || read -p "Update vim plugins? (y/N)" -n 1 -r
echo
if [[ "$YES" -eq 1 ]] || [[ $REPLY =~ ^[Yy]$ ]];
then
    nvim +PlugUpdate +qall
    nvim +UpdateRemotePlugin +qall
fi

[ $YES -eq 1 ] || read -p "Update gem? (y/N)" -n 1 -r
echo
if [[ "$YES" -eq 1 ]] || [[ $REPLY =~ ^[Yy]$ ]];
then
    gem update
fi

[ $YES -eq 1 ] || read -p "Update system? (y/N)" -n 1 -r
echo
if [[ "$YES" -eq 1 ]] || [[ $REPLY =~ ^[Yy]$ ]];
then
    sudo pacman -Syu
fi


cd "$PWD" || return
