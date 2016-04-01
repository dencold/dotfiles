# ---------------------------------------------------------------------------------------
# The bashrc profile setup script. Ever wonder what the difference is between the various
# profile files (.profile, .bashrc, .bash_profile)? Stack overflow has a good
# explanation:
#
# - .bash_profile and .bashrc are specific to bash (no kidding! :)
# - .profile is read by many shells in the absence of their own shell-specific config
#   files. (.profile was used by the original Bourne shell.)
# - .bash_profile or .profile is read by login shells, along with .bashrc
# - subshells read only .bashrc.
#
# Between job control and modern windowing systems, .bashrc by itself doesn't get used
# much. If you use screen or tmux, screens/windows usually run subshells instead of login
# shells.
#
# http://serverfault.com/questions/261802/profile-vs-bash-profile-vs-bashrc
#
# Author: Dennis Coldwell (@dencold)
#

export OS_TYPE=`uname`
export EDITOR=vim
export GIT_EDITOR=vim

# histcontrol will ignore spaces AND ignore duplicates
HISTCONTROL=ignoreboth

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

export GOPATH=$HOME
export GOBIN=$HOME/bin
export PATH=$PATH:$HOME/bin

# if we have setup a .aliases file then load it in, note that this is set
# here so that user-defined aliases can take precendence over profile settings
if [[ -f $HOME/.aliases ]]; then
    source $HOME/.aliases
fi

# setup bash completion, needs to be installed via homebrew (see machine-setup repo)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# I like sexy-bash-prompt by twolfson (https://github.com/twolfson/sexy-bash-prompt)
# source it now...
if [[ -f $HOME/.bash_prompt ]]; then
    source $HOME/.bash_prompt
fi

# setup completion for awscli
complete -C aws_completer aws
