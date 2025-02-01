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

