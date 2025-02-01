# dotfiles

My dotfiles for configuring git/vim/zsh/etc. Please feel free to use/copy/modify any of the files here for your own usage. Hope it makes your development environment a little snazzier. The repo is organized by deploy targets, primarily macos & linux as theses are the machines I use most often. There are also some ancillary folders for work-specific configurations.

Each deployment has a `nix` subfolder and an `install.sh` script. I've switched to use nix as my package manager. It is cross-platform and has by far the largest package repository available. Nix has some specialized handling for macos builds, so please check the `README.md` in the `macos` subdir for instructions on how to get that going.

## General instructions for fresh install

If you have a new machine that you are ready to deploy your environment to, here are the general steps:

1. Install git and clone this repository.
2. cd into the subdir of the deploy target (e.g. `macos`)
3. Install nix and run the build steps from the `nix` subdirectory.
4. Run the `install.sh` script to put all your dotfiles in place.
5. Celebrate your beautiful setup 🎉
