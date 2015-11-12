#!/bin/bash
# Simple bash script to install dotfiles for vim/bash/etc.
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

# first, figure out what directory we are in. This script is called from the main 
# install.sh in the root directory (dotfiles). This SO article is *very* helpful:
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "- Installing .profile"
cp -p $DIR/.bashrc $HOME/.bashrc
cp -p $DIR/.bash_profile $HOME/.bash_profile
cp -p $DIR/.inputrc $HOME/.inputrc

# finally, copy .vimrc
cp -p $DIR/.vimrc $HOME/.vimrc

