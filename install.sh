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
# Directory Creation
# - cleans anything that has been installed to DEPLOY_DIR & recreates.
#-----------------------------------------------------------------------------------
echo "Cleaning any previous dotfiles..."
rm -rf $HOME/.vim; rm -rf $HOME/.vim

echo
echo "!! FINISHED - dotfiles install"
echo "- reminder that you may need to source your new profile"
