# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git httpie pass pip pyenv sudo virtualenvwrapper wd)

source $ZSH/oh-my-zsh.sh

# powerlevel10k configuration
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# User configuration
export PAGER=most
export BROWSER=elinks
export SSH_ASKPASS=qt4-ssh-askpass
export AUTEUR="Olivier DOSSMANN"
export DEFAULT_USER="od"
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Enlève le prompt de droite après avoir appuyé sur Entrée
setopt transient_rprompt

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="${EDITOR}"
alias mem='free -mt'
alias df='df -hT'
alias ls='exa'
alias ll='exa -l'
alias l='exa -F'
alias rgrep='rg --no-ignore'
export GREP_COLORS='ms=01;33:mc=01;33:s1=:cx=:fn=37;ln=32:bn=32:se=36'
alias diff='colordiff'
# évite de faire des erreurs
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color'
# requêtes
alias https='http --verify=no --default-scheme=https'
# pytest
alias pyt='pipenv run pytest -vvs --no-cov --disable-warnings'
alias pytc='pipenv run pytest -vvs --disable-warnings --cov-report=xml:cov.xml'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Connexion automatique
mkdir -p "${HOME}/etc/ssh";
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

# Launch nvm possibilities (for javascript environment)
case $HOST in
  lueur | baloo | sam)
    :
    ;;
  *)
    source /usr/share/nvm/init-nvm.sh
    ;;
esac
