# macos dotfiles setup

Setting up a fresh install on your macos device. You've come to the right place. Here are the steps to go from a sad terminal experience like this.
![image](https://github.com/user-attachments/assets/46d763a2-db72-464d-adfb-b7ad2e6355ea)

...into this [todo - attach after shot here]

## Prework on macos, getting git installed

Unfortunately macos still doesn't have `git` installed by default as of the Sequoia release (2024). You'll want to get it by running Xcode Command Line Tools. Run the following command in your terminal:

```
xcode-select --install
```

You should see a mac prompt popup:
![image](https://github.com/user-attachments/assets/8cb94071-b778-4d36-a199-a6e8627e0d0a)

Click "install" and in ~5 minutes you'll have git installed.

Next you'll want to set your hostname, you can do this via system preferences, but easier to do it in the terminal while you are here. You'll need to do it in two places one for the mac internal naming, the other for how it will be identified on the local network:

```
scutil --set ComputerName "your-chosen-name"
scutil --set LocalHostName "your-chosen-name"
```

Finally, you'll need to get your ssh keys generated and added to github, the best resource for this is off of Github's official docs:

- [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Once that's done, you're finally ready to clone this repository and get rolling on your machine setup:

```
mkdir -p $HOME/src/github.com/dencold
git clone git@github.com:dencold/dotfiles.git $HOME/src/github.com/dencold/dotfiles
```

## Installing packages with nix

I use [nix](https://nixos.org/) to handle cross-platform package management. I use it to install both unix packages like neovim as well as gui apps like alacritty and even mac specific programs like aerospace. It also allows us to configure system preferences like Dock behavior and autolock timings. First step is to get it installed. I like [this guide](https://nixcademy.com/posts/nix-on-macos/), here are the pertinent steps:

Run this shell command:
```
curl \
  --proto '=https' \
  --tlsv1.2 \
  -sSf \
  -L https://install.determinate.systems/nix \
  | sh -s -- install
```

Next cd into the `nix` subdirectory and run the following command:
```
nix run nix-darwin -- switch --flake .#macos
```

That should do the work to get your system setup.

## Installing dotfiles

Finally, we're at the point to install all our dotfiles. We'll use the `install.sh` script which is in charge of deploying all our dotfiles as symlinks into the right locations on the filesystem. It's like [GNU stow]([url](https://www.gnu.org/software/stow/)) but simpler and more explicit. Using symlinks has the benefit of easily changing our settings and have them take effect immediately, and still can be committed to git once you are happy with the changes. Run the following command in the `macos` subdir of this repository:
```
./install.sh
```

## Fin

That should be all you need to do! Exit out of your terminal and restart to see the changes take effect \o/
