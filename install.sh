#!/usr/bin/env bash
# ---------------------------------------------------------------------------------------
# Installation script for dotfiles. This script determines what OS the user is running
# and calls the appropriate os-specific script in either the osx or linux subdirectories.
# This script also handles the installation of vim packages which are agnostic to OS 
# type.
#
# author: @dencold
#

# Variable setup
OS_TYPE=`uname`

# Warning message & prompt for users
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

#-----------------------------------------------------------------------------------
# Directory Initialization
# - sets up our required directories
#-----------------------------------------------------------------------------------
echo "- Creating initial directories"
mkdir -p $HOME/src $HOME/bin $HOME/tmp
mkdir -p $HOME/.vim/backup $HOME/.vim/swp

if [[ "$OS_TYPE" == 'Darwin' ]]; then
        # execute the OSX specific install script
        ./osx/install.sh 
elif [[ "$OS_TYPE" == 'Linux' ]]; then
        ./linux/install.sh
fi

#-----------------------------------------------------------------------------------
# vim
# - installs vim dotfiles & associated plugins
#-----------------------------------------------------------------------------------
echo "- Installing vim directory/plugins"
rm -rf $HOME/.vim

# first we initialize the plugin submodules, see the README for this repository
# for more background on what is happening here.
git submodule init vim/bundle
git submodule update --init --recursive vim/bundle

# now install our vim directory
cp -rp vim $HOME/.vim

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile"
echo
