export PATH=~/bin/:$PATH
export PAGER=most
export EDITOR=vim
export BROWSER=elinks

export AUTEUR="Olivier DOSSMANN"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

### INITIAL ZSHRC ###

# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1

typeset PROMPT="%F{white}%n %B%F{magenta}%(4~|...|)%3~%F{white} %# %b%f%k"
# Ajoute le nom du chroot sur la droite
typeset RPROMPT="${debian_chroot:+($debian_chroot) } %m" #%(1j.%j:.)%n@%m"

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
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

#### Solution 2
####
# Not all servers have terminfo for rxvt-256color.
#if [ "${TERM}" = 'rxvt-256color' ] && ! [ -f '/usr/share/terminfo/r/rxvt-256color' ] && ! [ -f '/lib/terminfo/r/rxvt-256color' ] && ! [ -f "${HOME}/.terminfo/r/rxvt-256color" ]; then
#  export TERM='rxvt-unicode'
#fi
#
#if [ "${TERM}" = 'xterm-termite' ] && ! [ -f '/usr/share/terminfo/x/xterm-termite' ] && ! [ -f '/lib/terminfo/r/xterm-termite' ] && ! [ -f "${HOME}/.terminfo/r/xterm-termite" ]; then
#  export TERM='xterm-256color'
#fi
#
#case $TERM in
#  rxvt*|xterm)
#    bindkey "^[[7~" beginning-of-line #Home key
#    bindkey "^[[8~" end-of-line #End key
#    bindkey "^[[3~" delete-char #Del key
#    bindkey "^[[A" history-beginning-search-backward #Up Arrow
#    bindkey "^[[B" history-beginning-search-forward #Down Arrow
#    bindkey "^[Oc" forward-word # control + right arrow
#    bindkey "^[Od" backward-word # control + left arrow
#    bindkey "^H" backward-kill-word # control + backspace
#    bindkey "^[[3^" kill-word # control + delete
#    ;;
#
#  xterm-termite|xterm-256color)
#    bindkey "^[OH" beginning-of-line #Home key
#    bindkey "^[OF" end-of-line #End key
#    bindkey "^[[3~" delete-char #Del key
#    bindkey "^[[A" history-beginning-search-backward #Up Arrow
#    bindkey "^[[B" history-beginning-search-forward #Down Arrow
#    bindkey "^[Oc" forward-word # control + right arrow
#    bindkey "^[Od" backward-word # control + left arrow
#    bindkey "^H" backward-kill-word # control + backspace
#    bindkey "^[[3^" kill-word # control + delete
#    ;;
#
#  linux)
#    bindkey "^[[1~" beginning-of-line #Home key
#    bindkey "^[[4~" end-of-line #End key
#    bindkey "^[[3~" delete-char #Del key
#    bindkey "^[[A" history-beginning-search-backward
#    bindkey "^[[B" history-beginning-search-forward
#    bindkey "^H" backward-delete-char
#    ;;
#
#  screen|screen-*)
#    bindkey "^[[1~" beginning-of-line #Home key
#    bindkey "^[[4~" end-of-line #End key
#    bindkey "^[[3~" delete-char #Del key
#    bindkey "^[[A" history-beginning-search-backward #Up Arrow
#    bindkey "^[[B" history-beginning-search-forward #Down Arrow
#    bindkey "^[Oc" forward-word # control + right arrow
#    bindkey "^[Od" backward-word # control + left arrow
#    bindkey "^H" backward-kill-word # control + backspace
#    bindkey "^[[3^" kill-word # control + delete
#    ;;
#esac
#
#####
##### End of Solution 2

#### Solution 1
#### 
# bindkey '^A' beginning-of-line # Home
# bindkey '^E' end-of-line # End
# bindkey '^D' delete-char # Del
# bindkey '^[[3~' delete-char # Del
# bindkey '^[[5~' history-search-backward # PgUp
# bindkey '^[[6~' history-search-forward # PgDn
# bindkey "\e[2~" overwrite-mode # Insert
# bindkey "\e[4~" end-of-line # End
# bindkey "\e[1~" beginning-of-line # Home
####
#### End of Solution 1

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
  echoti smkx
}
function zle-line-finish () {
  echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish

#Alias
## Permet la coloration du retour d'un `ls`
export LS_OPTIONS='--color=auto'
export GREP_COLORS='ms=01;33:mc=01;33:s1=:cx=:fn=37;ln=32:bn=32:se=36'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -CF'
alias rgrep='grep -r -n --color'
alias grep='grep --color'

## évite de faire des erreurs
alias rm='rm -i'
alias cp='cp -i'

alias vi='vim'
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
