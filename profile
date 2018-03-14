# This file provide user specific environment used as fallback from several tools

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  export PATH=$HOME/bin:$PATH
fi

# Search a TERMINAL for i3
for term in kitty termite qterminal urxvt rxvt-unicode sakura gnome-terminal; do
  if [ -n `which $term` ]; then
    export TERMINAL=`which $term`
    break
  fi
done

# Permit DBUS to be launched
if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
  export $(gnome-keyring-daemon -s)
fi
