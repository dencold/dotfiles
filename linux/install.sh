#!/bin/bash
# Simple bash script to install dotfiles for vim/bash/etc.
# This script is OSX specific.
#
# Usage:
# $ ./install.sh
#
# author: @dencold
#

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

# finally, copy .vimrc
cp -p .vimrc $HOME/.vimrc

