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
# bindkey '^A' beginning-of-line # Home
# bindkey '^E' end-of-line # End
# bindkey '^D' delete-char # Del
# bindkey '^[[3~' delete-char # Del
# bindkey '^[[5~' history-search-backward # PgUp
# bindkey '^[[6~' history-search-forward # PgDn
# bindkey "\e[2~" overwrite-mode # Insert
# bindkey "\e[4~" end-of-line # End
# bindkey "\e[1~" beginning-of-line # Home

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
