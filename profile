if [ -f $HOME/.alias ]; then
  source $HOME/.alias
fi

if [ -f $HOME/.exports ]; then
  source $HOME/.exports
fi

if [ -f $HOME/.functions ]; then
  source $HOME/.functions
fi

# =========== rbenv =============
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
