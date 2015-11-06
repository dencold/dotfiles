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

#-----------------------------------------------------------------------------------
# vim
# - installs vim dotfiles & associated plugins
#-----------------------------------------------------------------------------------
echo "- Installing vim dotfiles"

# first we initialize the plugin submodules, see the README for this repository
# for more background on what is happening here.
git submodule init ../vim/bundle
git submodule update --init --recursive ../vim/bundle

# now install our vim directory
cp -rp ../vim $HOME/.vim

# finally, copy .vimrc
cp -p .vimrc $HOME/.vimrc

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile"
echo
