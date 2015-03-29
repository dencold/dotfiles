# dotfiles

My dotfiles for configuring vim/bash/etc. Please feel free to use/copy/modify any of the files here for your own usage. Hope it makes your development environment a little snazzier.

## Notes

The vim dotfiles use the fantastic [pathogen](https://github.com/tpope/vim-pathogen) package by [@tpope](https://github.com/tpope) for plugin management. To make it easy to pull down the plugins used by `.vimrc`, I store them as [git submodules](http://git-scm.com/book/en/v2/Git-Tools-Submodules) in this repository. This requires a little more work after the initial clone as git does not pull submodules automatically. Read on young padawan...

### Submodule pull

Once you've cloned the dotfiles repo follow these steps to get the submodule code.

1. `cd vim/bundle`
2. `git submodule init`
3. `git submodule update`

Now if you cd into any of the subdirectories in the bundle directory, you'll see all of the source has been pulled down. 

Also note that the install script will do this automatically for you as well. 

Some helpful [reference from the git book](http://git-scm.com/book/en/v2/Git-Tools-Submodules#Cloning-a-Project-with-Submodules).
