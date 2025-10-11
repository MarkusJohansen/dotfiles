# Load prezto if installed
if [ -s "$HOME/.zprezto/init.zsh" ]; then
  source "$HOME/.zprezto/init.zsh"
fi

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"

# Editor & PATH
export EDITOR="nvim"
export VISUAL="$EDITOR"
path=("$HOME/.local/bin" $path)

# Aliases
alias ll='ls -alF'
alias gs='git status -sb'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias g="git"
alias gpp="git pull --rebase && git push"
alias rpi="ssh root@markusjohansen.no"

# Load environment variables from .environment file at root (avoids pushing env)
if [ -f ~/.environment ]; then
  set -a          # automatically export all variables
  source ~/.environment
  set +a
fi

