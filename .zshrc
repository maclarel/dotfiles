# Update PATH
if [[ "$HOST" == "laptocat"* ]]; then
        export PATH=$PATH:/Users/maclarel/tools/
fi

# Temp workaround
function kolide-stop() {
	sudo systemctl stop launcher.kolide-k2.service && \
	sudo killall osqueryd && \
  echo "Stopped kolide and osquery"
}

function kolide-start() {
	sudo systemctl start launcher.kolide-k2.service
	echo "Hit enter when authed and done."
	read
	echo "Stopping kolide and osquery..."
	kolide-stop
}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# unset PAGER, set by ^
unset PAGER

# Disable the damn bell
unsetopt BEEP

# Set theme
ZSH_THEME="agnoster"

# Add plugins 
plugins=(zsh-syntax-highlighting)

# Oh my ZSH goodies
source $ZSH/oh-my-zsh.sh

# User configuration

# Set EDITOR to nvim
export EDITOR="nvim"

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
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Aliases
alias flushdns='sudo killall -HUP mDNSResponder'					# Flush DNS Cache
alias ll='ls -lAtr'									# `ll` ala Linux
alias f='open -a Finder ./'								# Open Finder at current directory
alias myip='curl http://ipecho.net/plain; echo'						# Get Public IP
alias c='clear'										# Clear terminal
alias v='nvim'										# Saving keystrokes for vim
alias sv='sudo nvim'									# See above
alias reload='source ~/.zshrc'								# Reload dotfile
alias ytd="youtube-dl -f bestvideo+bestaudio "                                          # youtube-dl best video/audio
alias ga='git add'									# Save keystrokes for git
alias gac='git add -A && git commit -m'
alias pull='git pull'
alias push='git push'
alias gs='git status'
alias gc='git checkout'
alias gd='git diff'
alias updog='python3 -m http.server 9001' # Create webserver serving content from cwd
alias suspend='~/.scripts/scrlock.sh suspend'
alias copy='rsync -Phua'
alias phone="sudo aft-mtp-mount -o allow_other"
alias ks="kolide-start"
alias bar='nohup waybar >>/var/log/waybar.log 2>&1 &'

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

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
