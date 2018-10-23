if [ -d "$HOME/.local/bin" ] ; then
  export PATH=$HOME/.local/bin:$PATH
fi

export PATH=~/bin:$PATH
export PAGER=most
export EDITOR=nvim
export BROWSER=elinks

export SSH_ASKPASS=qt4-ssh-askpass

export AUTEUR="Olivier DOSSMANN"

export WORKON_HOME=~/.virtualenvs
source `locate virtualenvwrapper.sh`

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# Autocomplètement supplémentaire (Docker)
if [ -d "$HOME/.zsh/completion" ] ; then
  fpath=(~/.zsh/completion $fpath)
fi

### INITIAL ZSHRC ###

# Set up the prompt (prefered theme: adam1)
autoload -Uz compinit promptinit vcs_info
compinit # for Git completion
promptinit
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
# Git info: display current branch
zstyle ':vcs_info:git*' formats "%F{magenta}  %b%f%k"
# Affichage des 2 derniers membres de l'adresse du répertoire courant
# Un symbole pour l'utilisateur. ROUGE si root.
typeset PROMPT="%B%(!.%F{red}.%F{yellow})%#%b%f%k "
# VCS (chroot) hostname
case $HOST in
  lueur)
    hcolor=red
    ;;
  baloo)
    hcolor=magenta
    ;;
  *)
    hcolor=cyan
    ;;
esac
typeset RPROMPT="%B%F{white}%(5~|…/%2~|%~)\$vcs_info_msg_0_ ${debian_chroot:+($debian_chroot)}%B%F{$hcolor}%m%f%k"

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit && compinit -i
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

###### END OF INITIAL ZSHRC

# Correspondance touches-fonction
#
# touches courantes
bindkey "^[[A" history-beginning-search-backward #Up Arrow
bindkey "^[[B" history-beginning-search-forward #Down Arrow
bindkey "^[[3~" delete-char #Del key

# touches suivant le terminal?
case $TERM in
  rxvt*|xterm)
    bindkey "^[[7~" beginning-of-line #Home key
    bindkey "^[[8~" end-of-line #End key
    bindkey "^[Oc" forward-word # control + right arrow
    bindkey "^[Od" backward-word # control + left arrow
    bindkey "^H" backward-kill-word # control + backspace
    bindkey "^[[3^" kill-word # control + delete
    ;;

  xterm-termite|xterm-256color)
    bindkey "^[[H" beginning-of-line #Home key
    bindkey "^[[F" end-of-line #End key
    bindkey "^[Oc" forward-word # control + right arrow
    bindkey "^[Od" backward-word # control + left arrow
    bindkey "^H" backward-kill-word # control + backspace
    bindkey "^[[3^" kill-word # control + delete
    ;;

  linux)
    bindkey "^[[1~" beginning-of-line #Home key
    bindkey "^[[4~" end-of-line #End key
    bindkey "^H" backward-delete-char
    ;;

  screen|screen-*)
    bindkey "^[[1~" beginning-of-line #Home key
    bindkey "^[[4~" end-of-line #End key
    bindkey "^[Oc" forward-word # control + right arrow
    bindkey "^[Od" backward-word # control + left arrow
    bindkey "^H" backward-kill-word # control + backspace
    bindkey "^[[3^" kill-word # control + delete
    ;;

  tmux|tmux-*)
    bindkey "^[[1~" beginning-of-line #Home key
    bindkey "^[[4~" end-of-line #End key
    ;;

  kitty|xterm-kitty)
    bindkey "^[[H" beginning-of-line #Home key
    bindkey "^[[F" end-of-line #End key
    ;;
esac

# Alias
## Permet la coloration du retour d'un `ls`
export GREP_COLORS='ms=01;33:mc=01;33:s1=:cx=:fn=37;ln=32:bn=32:se=36'
alias ls='exa'
alias ll='exa -l'
alias l='exa -F'
alias rgrep='rg'
alias grep='grep --color'

## évite de faire des erreurs
alias rm='rm -i'
alias cp='cp -i'

alias vi="${EDITOR}"
alias mem='free -mt'
alias df='df -hT'

### PROPRES à ZSH

## Global aliases (expand whatever their position)
## e.g find . E L
alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g N='> /dev/null'
alias -g E='2> /dev/null'

## Set up auto extension stuff
alias -s html=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh
alias -s txt=$EDITOR
alias -s md=$EDITOR
#alias -s org=$BROWSER
#alias -s php=$BROWSER
#alias -s com=$BROWSER
#alias -s net=$BROWSER
alias -s sxw=libreoffice
alias -s doc=libreoffice
alias -s odt=libreoffice
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf
alias -s xz=tar -xvfJ
#alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

### END PROPRES à ZSH

# ssh-agent-procure.bash
# # v0.6.4
# # ensures that all shells sourcing this file in profile/rc scripts use the same ssh-agent.
# # copyright me, now; licensed under the DWTFYWT license.
#
mkdir -p "$HOME/etc/ssh";

function ssh-procure-launch-agent {
  eval `ssh-agent -s -a ~/etc/ssh/ssh-agent-socket`;
  ssh-add;
}

if [ ! $SSH_AGENT_PID ]; then
  if [ -e ~/etc/ssh/ssh-agent-socket ] ; then
    SSH_AGENT_PID=`ps -fC ssh-agent |grep 'etc/ssh/ssh-agent-socket' |sed -r 's/^\S+\s+(\S+).*$/\1/'`; 
    if [[ $SSH_AGENT_PID =~ [0-9]+ ]]; then
      # in this case the agent has already been launched and we are just attaching to it. 
      ##++  It should check that this pid is actually active & belongs to an ssh instance
      export SSH_AGENT_PID;
      SSH_AUTH_SOCK=~/etc/ssh/ssh-agent-socket; export SSH_AUTH_SOCK;
    else
      # in this case there is no agent running, so the socket file is left over from a graceless agent termination.
      rm ~/etc/ssh/ssh-agent-socket;
      ssh-procure-launch-agent;
    fi;
  else
    ssh-procure-launch-agent;
  fi;
fi;

# Start X automatically
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
