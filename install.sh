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

#-----------------------------------------------------------------------------------
# Cleanup
# - removes any pre-installed dotfiles
#-----------------------------------------------------------------------------------
echo "- Cleaning any previous dotfiles"
rm -f $HOME/.vimrc; rm -rf $HOME/.vim;
rm -f $HOME/.bash_profile; rm -f $HOME/.bashrc;
rm -f $HOME/.inputrc

#-----------------------------------------------------------------------------------
# Directory Initialization
# - sets up our required directories
#-----------------------------------------------------------------------------------
echo "- Creating initial directories"
mkdir -p $HOME/src $HOME/bin

#-----------------------------------------------------------------------------------
# bash
# -installs .profile
#-----------------------------------------------------------------------------------
echo "- Installing .profile"
cp -p .bashrc $HOME/.bashrc
cp -p .bash_profile $HOME/.bash_profile
cp -p .inputrc $HOME/.inputrc

#-----------------------------------------------------------------------------------
# vim
# - installs vim dotfiles & associated plugins
#-----------------------------------------------------------------------------------
echo "- Installing vim dotfiles"

# Mac OSX has vim 7.3 installed by default, as a simple fix, we install VimR
# and symlink vim to our local bin directory. This gets us the latest & greatest
# version of vim painlessly.
if [[ "$OS_TYPE" == 'Darwin' ]]; then
    cp -p vim/bin/vimr $HOME/bin
fi

# first we initialize the plugin submodules, see the README for this repository
# for more background on what is happening here.
git submodule init vim/bundle
git submodule update --init --recursive vim/bundle

# now install our vim directory
cp -rp vim $HOME/.vim

# finally, copy .vimrc
cp -p .vimrc $HOME/.vimrc

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile"
echo
