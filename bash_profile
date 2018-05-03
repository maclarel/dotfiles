# Options
set -o vi										# vim mode for bash

# Aliases

alias flushdns='sudo killall -HUP mDNSResponder'					# Flush DNS Cache
alias sublime='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'		# Open something in Sublime Text
alias ll='ls -latr'									# `ll` ala Linux
alias f='open -a Finder ./'								# Open Finder at current directory
alias myip='curl http://ipecho.net/plain; echo'						# Get Public IP
alias c='clear'										# Clear terminal
alias v='vim'										# Saving keystrokes for vim
alias reload='source ~/.bash_profile'							# Reload bash_profile

# Colour

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "	# Pretty colours!
export CLICOLOR=1									
export LSCOLORS=ExFxBxDxCxegedabagacad

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
