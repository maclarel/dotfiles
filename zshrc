# Update PATH
export PATH="/$PATH:$HOME/.rvm/bin:usr/local/opt/grep/libexec/gnubin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/maclarel/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

# Add plugins 
plugins=( git zsh-syntax-highlighting)

# Oh my ZSH goodies
source $ZSH/oh-my-zsh.sh

# User configuration

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Reverse search
bindkey '^R' history-incremental-search-backward

# Enable colors and change prompt:
autoload -U colors && colors

# Aliases
alias flushdns='sudo killall -HUP mDNSResponder'					# Flush DNS Cache
alias ll='ls -lAtr'									# `ll` ala Linux
alias f='open -a Finder ./'								# Open Finder at current directory
alias myip='curl http://ipecho.net/plain; echo'						# Get Public IP
alias c='clear'										# Clear terminal
alias v='vim'										# Saving keystrokes for vim
alias sv='sudo vim'									# See above
alias reload='source ~/.zshrc'								# Reload bash_profile
alias ga='git add'									# Save keystrokes for git
alias gac='git add -A && git commit -m'
alias pull='git pull'
alias push='git push'
alias gs='git status'
alias gc='git checkout'
alias gd='git diff'

# File Management

   extract () {										# Extract basically all known formats
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
