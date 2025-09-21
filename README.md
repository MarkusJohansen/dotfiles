# These are my dotfile repos

Loads of configs, backed up at github

Currently I store configs for 

- zsh => shell
- wezterm => terminal emulator

## How to handle changes

In the repository root, run the following commands to..


Create new symlinks
```zsh
stow -n -t "$HOME" wezterm git zsh
```

Refresh new symlinks
```zsh
stow -R -t "$HOME" wezterm git zsh
```

