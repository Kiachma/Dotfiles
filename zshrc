# Path to your oh-my-zsh installation.
export ZSH=/home/eaura/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="theunraveler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh


# optionally define some options
PURE_PROMPT_SYMBOL="❯"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize git-flow-avh node npm zsh-syntax-highlighting)

# User configuration
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias albin='ssh eaura@albin.abo.fi'
alias home="cd ~/"
alias upgrade='sudo apt update && sudo apt upgrade'
alias install='sudo apt-get install'
alias uninstall='sudo apt-get remove'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias ntnu='ssh emilia@login.stud.ntnu.no'
alias webfaction='ssh kiachma@web583.webfaction.com'
alias t='todo.sh'
alias jolla='ssh nemo@192.168.1.139'


extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
 export LANG=sv_FI.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"


export CHROME_BIN=/usr/bin/google-chrome-beta
export BROWSER=firefox-developer
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dsun.java2d.xrender=true'
export EDITOR=nano
export VISUAL=nano
GMON_OUT_PREFIX="gmon".`uname -n`
export GMON_OUT_PREFIX
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export FIREFOX_BIN=/usr/bin/firefox
# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin:/usr/bin:/home/eaura/.bin:/home/eaura/.local/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fpath=( "$HOME/.zfunctions" $fpath )

[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# ROS
lunar() {
 source /opt/ros/lunar/setup.zsh
 source $HOME/catkin_ws/devel/setup.zsh
  export PYTHONPATH=/opt/ros/lunar/lib/python2.7/site-packages:$PYTHONPATH
  export PKG_CONFIG_PATH="/opt/ros/lunar/lib/pkgconfig:$PKG_CONFIG_PATH"
  # Optionally, you can set:
  #export ROS_PACKAGE_PATH=/path/to/your/package/path:$ROS_PACKAGE_PATH

  # Useful aliases
  alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"

  # If you use Gazebo:
  source /usr/share/gazebo/setup.sh
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

