typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "$path[@]")
export PATH

# Autocomplètement supplémentaire (Docker)
if [ -d "$HOME/.zsh/completion" ] ; then
  fpath=(~/.zsh/completion $fpath)
fi
