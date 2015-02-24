# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aura"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias albin='ssh eaura@albin.abo.fi'
alias home="cd ~/"
alias upgrade='pacaur -Syu'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias ntnu='ssh emilia@login.stud.ntnu.no'
alias webfaction='ssh kiachma@web332.webfaction.com'
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
SSHPID=`ps ax|grep -c "[s]sh-agent"`
if (( $SSHPID == 0 ))
then
    ssh-agent > ~/.ssh-env
    source ~/.ssh-env
    ssh-add
else
    source ~/.ssh-env
fi
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(docker,colorize,git,archlinux,django,git-flow,github)

source $ZSH/oh-my-zsh.sh

export CHROME_BIN=/usr/bin/google-chrome-beta
export BROWSER=firefox-developer
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export EDITOR=vim
GMON_OUT_PREFIX="gmon".`uname -n`
export GMON_OUT_PREFIX
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export FIREFOX_BIN=/usr/bin/firefox-developer
# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin:/usr/bin/:/home/eaura/.bin/

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
