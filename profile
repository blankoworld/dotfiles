# This file provide user specific environment used as fallback from several tools

export PATH=~/bin:$PATH

# Search a TERMINAL for i3
for term in termite urxvt rxvt-unicode gnome-terminal; do
  if [ -n `which $term` ]; then
    export TERMINAL=`which $term`
    break
  fi
done
