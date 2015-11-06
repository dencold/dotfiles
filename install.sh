#!/bin/bash
#
# File:     install.sh
# Author:   Dennis Coldwell (@dencold)
#
# Description:
# Simple bash script to install dotfiles for vim/bash/etc. 
#
# Usage:
# $ ./install.sh
#

echo 
echo "************************ WARNING - DOTFILES INSTALL ************************ "
echo 
echo "   Running this script will replace your dotfiles (.vimrc/.bashrc/etc.)   "
echo "   and any associated config directories (such as .vim) "
echo "   Back up previous versions if they are important to you. "
echo ""
echo "************************* YOU HAVE BEEN WARNED! :) ************************** "
echo 
read -p "Are you SURE? (y/N) ==> " SURE

if [[ "$SURE" != "Y" && "$SURE" != "y" ]];
then
    echo "Aborting dotfiles install."
    exit 0
fi

OS_TYPE=`uname`

if [[ "$OS_TYPE" == 'Darwin' ]]; then
        # execute the OSX specific install script
        ./osx/install.sh 
elif [[ "OS_TYPE" == 'Linux' ]]; then
        ./linux/install.sh
fi

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile"
echo
