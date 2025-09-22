# These are my dotfile repos

Loads of configs, backed up at github

Currently I store configs for 

- zsh => shell
- wezterm => terminal emulator
- git => version control

## New device

run this to ensure zprezto is installed

```zsh
test -d "${ZDOTDIR:-$HOME}/.zprezto" || \
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

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
## Environment variables

To set new environment variables in a safe manner, DO NOT add them to the .zshrc as we dont want to push them.
Instead we load a file at root called `.environment` for global variables. 
