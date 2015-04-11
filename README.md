# dotfiles

My dotfiles for configuring vim/bash/etc. Please feel free to use/copy/modify any of the files here for your own usage. Hope it makes your development environment a little snazzier.

For convenience, this repository has an install script at its root. This will clean up any current dotfiles and install the configuration to their appropriate directories. Here are the steps to run:

1. `git clone git@github.com:dencold/dotfiles.git`
2. `cd dotfiles`
3. `./install.sh`

That's it! You should be able to open a new terminal session and benefit from the configuration.

## Notes

The vim dotfiles use the fantastic [pathogen](https://github.com/tpope/vim-pathogen) package by [@tpope](https://github.com/tpope) for plugin management. To make it easy to pull down the plugins used by `.vimrc`, I store them as [git submodules](http://git-scm.com/book/en/v2/Git-Tools-Submodules) in this repository. This requires a little more work after the initial clone as git does not pull submodules automatically. Read on young padawan...

### Submodule pull

Once you've cloned the dotfiles repo follow these steps to get the submodule code.

1. `git submodule init vim/bundle`
2. `git submodule update vim/bundle`

Now if you cd into any of the subdirectories in the bundle directory, you'll see all of the source has been pulled down. 

Also note that the [install script](https://github.com/dencold/dotfiles/blob/master/install.sh) will do this automatically for you as well. 

Some helpful [reference from the git book](http://git-scm.com/book/en/v2/Git-Tools-Submodules#Cloning-a-Project-with-Submodules).
