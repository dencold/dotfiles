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

### Adding new packages

If you'd like to add additional packages to pathogen, follow these steps:

1. Locate the package's repository link (e.g. [https://github.com/fatih/vim-go.git](https://github.com/fatih/vim-go.git))
2. Add it as a submodule in the `vim/bundle` directory:

	```
	git submodule add https://github.com/fatih/vim-go.git \
	    vim/bundle/vim-go
	```

3. Run the install script at the dotfiles root: `./install.sh`
4. Restart vim and you should see the new package installed.
5. Last bit of housekeeping, we'll want to commit the package to our git repository. Do so with the following commands:

	```
	git add .gitmodules vim/bundle/vim-go
	git commit
	```

### Removing unwanted packages

Removing packages is a litle more involved. There isn't a dedicated git command for deleting submodules so we have some extra hoops to go through. A good reference here is [this entry on stackoverflow](http://stackoverflow.com/a/1260982). Here are the steps:

1. Delete the relevant section from the `.gitmodules` file
2. Stage the .gitmodules changes: `git add .gitmodules`
3. Delete the relevant section from `.git/config`
4. Run `git rm --cached path_to_submodule` (no trailing slash)
5. Run `rm -rf .git/modules/path_to_submodule`
6. Commit: `git commit -m "Removed submodule <name>"`
7. Delete the now untracked submodule files: `rm -rf path_to_submodule`

You once you are done with those steps, you can re-run the `install.sh` script and the package will be removed.

