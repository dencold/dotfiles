#!/bin/bash
# Simple bash script to install dotfiles for vim/bash/etc.
# This script is OSX specific.
#
# Usage:
# $ ./install.sh
#
# author: @dencold
#

# first, figure out what directory we are in. This script is called from the main 
# install.sh in the root directory (dotfiles). This SO article is *very* helpful:
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "- Installing profiles"
for file in .aliases .bashrc .bash_profile .bash_prompt .inputrc; do
    cp -p $DIR/$file $HOME/$file;
done;

# finally, copy .vimrc
echo "- Installing vim config"
cp -p $DIR/.vimrc $HOME/.vimrc

echo "- Installing git config"
for file in .gitignore .gitconfig; do
    cp -p $DIR/$file $HOME/$file;
done;
