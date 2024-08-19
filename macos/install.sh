#!/bin/bash
# Simple bash script to install dotfiles for vim/bash/etc.
#
# author: @dencold
#

# Warning message & prompt for users
echo
echo "************************ WARNING - DOTFILES INSTALL ************************ "
echo
echo "   Running this script will replace your dotfiles (.vimrc/.zshrc/etc.)   "
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
mkdir -p $HOME/src $HOME/bin $HOME/tmp $HOME/.zsh

# figure out what directory we are in. This script is called from the main 
# install.sh in the root directory (dotfiles). This SO article is *very* helpful:
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "- Installing zsh profile"
cp -p $DIR/.zshrc $HOME/.zshrc
cp -p $DIR/.fzf.zsh $HOME/.zsh/.fzf.zsh

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

#-----------------------------------------------------------------------------------
# vim
# - installs vim dotfiles & associated plugins
#-----------------------------------------------------------------------------------
echo "- Installing vim directory/plugins"
rm -rf $HOME/.vim

# create our directory structure
for d in backup swp pack/plugins/start pack/plugins/opt; do
    mkdir -p $HOME/.vim/$d
done;

# install vim packages
git clone https://github.com/bling/vim-airline $HOME/.vim/pack/plugins/start/

# create our the directories where backups will go

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile"
echo
