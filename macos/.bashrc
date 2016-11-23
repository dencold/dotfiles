# ---------------------------------------------------------------------------------------
# The bashrc profile setup script. Ever wonder what the difference is between the various
# profile files (.profile, .bashrc, .bash_profile)? Stack overflow has a good
# explanation:
#
# - .bash_profile and .bashrc are specific to bash (no kidding! :)
# - .profile is read by many shells in the absence of their own shell-specific config files.
#   (.profile was used by the original Bourne shell.) 
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
[ -n "$PS1" ] && source ~/.bash_profile;

