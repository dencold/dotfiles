# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------------------------------------------------------------------
# My zsh profile
#
# Mostly influenced from the set of posts from Armin on:
# https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/
#
# Author: Dennis Coldwell (@dencold)
#

# Set our zsh options
setopt AUTO_CD                  # automatically change dirs without explit cd
setopt NO_CASE_GLOB             # make globbing case-insensitive
setopt EXTENDED_HISTORY         # add extra helpful data like timestamps in hist
setopt SHARE_HISTORY            # share history across multiple terminal sessions
setopt APPEND_HISTORY           # don't overwrite history on new session
setopt INC_APPEND_HISTORY       # don't wait for shell exit to append, do it on every command
setopt HIST_EXPIRE_DUPS_FIRST   # expire duplicates first
setopt HIST_IGNORE_DUPS         # do not store duplications
setopt HIST_FIND_NO_DUPS        # ignore duplicates when searching
setopt HIST_REDUCE_BLANKS       # removes blank lines from history
setopt CORRECT                  # suffer from fat-fingers? let zsh fix for you
setopt CORRECT_ALL

# Set the location of zsh history file
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=5000
export HISTSIZE=2000

### [dc 2025-02-01] Commenting out for now, may look to remove/handle thru nix 
# ---------------------------------------------------------------------------------------
# Setup the powerlevel10k theme
# IMPORTANT NOTE! Make sure to change the Color Preset on iterm2 to use 
# "Solarized Dark" to make this look really nice. You have to go to "colors"
# tab within the Profile setting.
# source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
# [[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# ---------------------------------------------------------------------------------------
# Setup our aliases
alias d="cd ~/GDrive"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/src/github.com/dencold"
alias g="git"
alias h="history"
alias j="jobs"
alias v="nvim"
alias vim="nvim"
alias sudo="sudo "
alias ls="ls -G "
alias ll="ls -altr"

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

# ---------------------------------------------------------------------------------------
# Tab Completion!
# autoload compinit is required to get tab completion going
autoload -Uz compinit && compinit

### [dc 2025-02-01] Commenting out for now, may look to remove fzf
# note that zsh tab completion is super archaic and confusing, if you want to see an
# example of an interface that goes waaay too far into the weeds, try running compinstall
# sometime. YIKES.
# lucky for us, we have fzf to save the day. We'll replace zsh tab completion with fzf
# see this repo for all the details: https://github.com/Aloxaf/fzf-tab
# (note that you need to have fzf installed and cloned this directory into the ZDOTDIR
# [ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh
# [ -f $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh ] && source $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
