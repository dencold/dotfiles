#!/bin/zsh
# Simple zsh script to install dotfiles for macos-based systems.
#
# author: @dencold
#

# create any required directories
mkdir -p $HOME/.config

echo "- Installing dotfiles via symlinks"

# figure out what directory the script is located in, see:
# https://unix.stackexchange.com/questions/76505/unix-portable-way-to-get-scripts-absolute-path-in-zsh
DIR=${0:a:h}

echo "- Installing zsh"
ln -s $DIR/zsh/.zshrc $HOME/.zshrc

echo "- Installing git"
ln -s $DIR/git/.gitignore $HOME/.gitignore
ln -s $DIR/git/.gitconfig $HOME/.gitconfig

echo "- Installing aerospace"
ln -s $DIR/aerospace $HOME/.config/aerospace

echo "- Installing nix"
ln -s $DIR/nix $HOME/nix

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile/relaunch your terminal"
echo
