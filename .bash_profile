# ---------------------------------------------------------------------------------------
# bash profile file for configuring the shell's environment. 
#
# Author:   Dennis Coldwell (@dencold)
#

OS_TYPE=`uname`
export EDITOR=vim
export GIT_EDITOR=vim

# histcontrol will ignore spaces AND ignore duplicates
HISTCONTROL=ignoreboth

export GOPATH=$HOME
export GOBIN=$HOME/bin
export PATH=$PATH:$HOME/bin

# alias setup
if [[ "$OS_TYPE" == 'Darwin' ]]; then
    alias vim='vimr'
    alias ls='ls -G'

elif [[ "$OS_TYPE" == 'Linux' ]]; then
    alias ls='ls --color'
fi

alias vi=vim

# if we have setup a .aliases file then load it in, note that this is set
# here so that user-defined aliases can take precendence over profile settings
if [[ -f $HOME/.aliases ]]; then
    source $HOME/.aliases
fi

