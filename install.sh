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

echo "************************ WARNING - DOTFILES INSTALL ************************ "
echo ""
echo "   Running this script will replace your dotfiles (.vimrc/.bashrc/etc.)   "
echo "   And any associated config directories (such as .vim) "
echo "   Back up previous versions if they are important to you. "
echo ""
echo "************************* YOU HAVE BEEN WARNED! :) ************************** "
echo "Are you SURE? (y/N) ==> "
read SURE

if [[ "$SURE" != "Y" && "$SURE" != "y" ]];
then
    exit 0
fi

#-----------------------------------------------------------------------------------
# Cleanup
# - removes any pre-installed dotfiles
#-----------------------------------------------------------------------------------
echo "Cleaning any previous dotfiles..."
rm -f $HOME/.vimrc; rm -rf $HOME/.vim

#-----------------------------------------------------------------------------------
# vim
# - installs vim dotfiles & associated plugins
#-----------------------------------------------------------------------------------
echo "Installing vim dotfiles..."

# first we initialize the plugin submodules
git submodule init vim/bundle
git submodule update vim/bundle

# now install our vim directory
cp -rp vim $HOME/.vim

# finally, symlink our vimrc file to .vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

echo
echo "!! FINISHED - dotfiles install"
echo "- reminder that you may need to source your new profile"
echo
