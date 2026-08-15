# ---------------------------------------------------------------------------------------
# My zsh profile
#
# Mostly influenced from the set of posts from Armin on:
# https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/
#
# Author: Dennis Coldwell (@dencold)
#

# Set our zsh options
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

# ---------------------------------------------------------------------------------------
# Path settings
# Note that this is LIFO, so the last line wins, make sure preferred tools are at the
# bottom of the block to take precedence over things above.
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$HOME/bin:$PATH
typeset -aU path    # dedupe step

# ---------------------------------------------------------------------------------------
# Shell env variables
export GITPRJ="$HOME/src/github.com/dencold"

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
alias top=btop

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

## Homebrew maintenance helpers
# Homebrew maintenance helpers

# Checks for outdated formulae/casks and Brewfile drift (installed vs. tracked).
brchk() {
  brew update
  echo "── Formulae ──"
  brew outdated
  echo "── Casks ──"
  brew outdated --cask

  echo "── Brewfile drift ──"
  local brewfile="$GITPRJ/dotfiles/macos/homebrew/Brewfile"
  local missing_from_system extra_installed

  missing_from_system=$(brew bundle check --file="$brewfile" 2>&1)
  extra_installed=$(brew bundle cleanup --file="$brewfile" 2>&1 \
    | grep -v "Run \`brew bundle cleanup --force\`")

  if [[ "$missing_from_system" != *"satisfied"* ]] || [[ -n "$extra_installed" ]]; then
    echo "$missing_from_system"
    [[ -n "$extra_installed" ]] && echo "Installed but not in Brewfile:" && echo "$extra_installed"
    echo "Drift detected — run 'brup' to sync your Brewfile."
  else
    echo "No drift."
  fi
}

# Upgrades all formulae/casks, syncs the Brewfile, and cleans up old versions.
brup() {
  brew upgrade \
    && brew bundle dump --file="$GITPRJ/dotfiles/macos/homebrew/Brewfile" --force \
    && brew cleanup
}

# Installs a package by name, trying formula first then falling back to cask.
brin() {
  if [ -z "$1" ]; then
    echo "Usage: brin <package-name>"
    return 1
  fi

  if brew install "$1"; then
    return 0
  fi

  echo "Formula install failed, trying as a cask..."
  brew install --cask "$1"
}

# Uninstalls a package by name, detecting whether it's a formula or cask.
brrm() {
  if [ -z "$1" ]; then
    echo "Usage: brrm <package-name>"
    return 1
  fi

  if brew list --formula "$1" &>/dev/null; then
    brew uninstall "$1"
  elif brew list --cask "$1" &>/dev/null; then
    brew uninstall --cask "$1"
  else
    echo "'$1' is not installed (formula or cask)."
    return 1
  fi
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

# ---------------------------------------------------------------------------------------
# Make the terminal beautiful with starship
# https://starship.rs/
# (note that it needs to be installed via homebrew)
eval "$(starship init zsh)"

# ---------------------------------------------------------------------------------------
# Claude code settings
# Because I've installed the Claude CLI via homebrew, this env var enables auto-update
# of the CLI
export CLAUDE_CODE_PACKAGE_MANAGER_AUTO_UPDATE=1
