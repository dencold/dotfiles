#!/bin/zsh
# Simple zsh script to install dotfiles for macos-based systems.
#
# author: @dencold
#

# create any required directories
mkdir -p $HOME/.config

# figure out what directory the script is located in, see:
# https://unix.stackexchange.com/questions/76505/unix-portable-way-to-get-scripts-absolute-path-in-zsh
DIR=${0:a:h}

# A note on ln flags, we are using -svnf for the following reasons:
# -s creates the symbolic link
# -v turns on verbose mode so we can get output when we run the script
# -n makes it so we don't follow a symlink if it is a directory
# -f if target file already exists unlink so link can occur

echo "- Installing dotfiles via symlinks"
ln -svnf $DIR/zsh/.zshrc $HOME/.zshrc
ln -svnf $DIR/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -svnf $DIR/git/.gitignore $HOME/.gitignore
ln -svnf $DIR/git/.gitconfig $HOME/.gitconfig
ln -svnf $DIR/aerospace $HOME/.config/aerospace
ln -svnf $DIR/nix $HOME/nix
ln -svnf $DIR/alacritty $HOME/.config/alacritty

echo
echo "!! FINISHED - dotfiles install !!"
echo "- reminder that you may need to source your new profile/relaunch your terminal"
echo
