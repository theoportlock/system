# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shortcut aliases
alias ls='ls --color=auto'
alias l='ls --color=auto -lrth'
alias v='vim'
alias vi='vim'
alias lock='i3lock -c 000000'
alias m='mkdir'
alias t='touch'

function c {
    builtin cd "$@" && l 
    }

function b {
    builtin cd "../" && l 
    }

# scripts
export PATH=$PATH:~/system/scripts/

# setting the uk keyboard
setxkbmap gb

# change prompt colour
export PS1="\[\e[01;36m\]\t\[\e[m\]\[\e[01;36m\]\w\[\e[m\] "

# vim navigation commands
set -o vi

# bash history
HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
