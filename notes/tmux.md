# Tmux Notes

These are a collection of notes around my tmux setup, helpful to get refreshed on all the key-mappings & shortcuts.

## Startup

- `tmux` starts a brand new session
- `tmux -V` tells you what version of tmux you're using
- `tmux ls` lists existing sessions
- `tmux at -t <session number>` reattaches existing session
- `tmux at #` reattach last session

## General

- `C-a` is our global prefix key
- `r` reloads the .tmux.config file
- `d` detatches current tmux session
- `,` renames the current window

## Window/Pane Mangement

- `|` splits window vertically
- `-` splits window horizontally
- `w` creates a new window
- `Ctrl-d` closes panes

## Window/Pane Movement

- `h` select pane to the left
- `l` select pane to the right
- `k` select pane above
- `j` select pane below
- `o` cycle through open panes
- `m` select previous window
- `z` zooms current pane to fullscreen (z again restores)

## Copy/Paste

- `v` in edit mode, visually select. use vim movement to get around
- `y` copies and exits the edit mode

