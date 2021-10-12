# ---------------------------------------------------------------------------------------
# My zsh profile
#
# Mostly influenced from the set of posts from Armin on:
# https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/
#
# Author: Dennis Coldwell (@dencold)
#

# Set zsh directoy, without this it defaults to $HOME
export ZDOTDIR=$HOME/.zsh

# Set our zsh options
setopt AUTO_CD                  # automatically change dirs without explit cd
setopt NO_CASE_GLOB             # make globbing case-insensitive
setopt EXTENDED_HISTORY         # add extra helpful data like timestamps in hist
setopt SHARE_HISTORY            # share history across multiple terminal sessions
setopt APPEND_HISTORY           # don't overwrite history on new session
setopt INC_APPEND_HISTORY       # don't wait for shell exit to append, do it on every command
setopt HIST_EXPIRE_DUPS_FIRST   # expire duplicates first
setopt HIST_IGNORE_DUPS         # do not store duplications
setopt HIST_FIND_NO_DUPS        #ignore duplicates when searching
setopt HIST_REDUCE_BLANKS       # removes blank lines from history
setopt CORRECT                  # suffer from fat-fingers? let zsh fix for you
setopt CORRECT_ALL

# Set the location of zsh history file
export HISTFILE=$ZDOTDIR/.zsh_history
export SAVEHIST=5000
export HISTSIZE=2000

# ---------------------------------------------------------------------------------------
# Setup our aliases
alias d="cd ~/GDrive"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/src/github.com/dencold"
alias g="git"
alias h="history"
alias j="jobs"
alias vi="vim"
alias sudo="sudo "

# ---------------------------------------------------------------------------------------
# Set our functions

## get your weather forecast from the command line!
weather() {
    curl http://wttr.in/$1
}

## helpful ip stats
ipinfo() {
    curl http://ipinfo.io/$1
}

# BEGIN FIN RECOMMENDS (added by fin/wre-setup/setup_shell_profile.py)
export REDFIN_MAIN=$HOME/code/main
eval "$($HOME/code/fin/bin/fin init -)"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export PATH=~/bin:/usr/local/bin:~/code/scripts:${PATH}
alias corvair="$REDFIN_MAIN/bin/corvair"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`
ulimit -n 8000
# END FIN RECOMMENDS (added by fin/wre-setup/setup_shell_profile.py)
