#!/bin/bash
# Simple bash script to install dotfiles for vim/bash/etc.
# This script is macOS specific.
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
for file in .aliases .bashrc .bash_funcs .bash_profile .bash_prompt .inputrc; do
    cp -p $DIR/$file $HOME/$file;
done;

# finally, copy .vimrc
echo "- Installing vim config"
cp -p $DIR/.vimrc $HOME/.vimrc

echo "- Installing git config"
echo ""
echo "What's your full name (for git purposes)?"
read full_name
echo ""
echo "What's your email address?"
read email

for file in .gitignore .gitconfig; do
    cp -p $DIR/$file $HOME/$file;
done;

# replace the placeholders in .gitconfig with user input
sed -i -e "s/GIT_NAME/$full_name/g" $HOME/.gitconfig
sed -i -e "s/GIT_EMAIL/$email/g" $HOME/.gitconfig
