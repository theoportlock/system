# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shortcut aliases
alias ls='ls --color=auto'
alias l='ls --color=auto -lrth'
alias v='vim'
alias vi='vim'
alias c='cd'
alias lock='i3lock -c 000000'

# scripts
export PATH=$PATH:~/system/scripts/

# ccpnmr
export CCPNMR_TOP_DIR=/usr/local/ccpnmr
export PATH=$PATH:$CCPNMR_TOP_DIR/bin
export PATH=/opt/android-studio/jre/bin:$PATH

# setting the uk keyboard
setxkbmap gb
PS1='[\u@\h \W]\$ '

# vim navigation commands
set -o vi
