# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shortcut aliases
alias l='ls --color=auto -lrth'
alias ls='ls --color=auto -lrth'
alias v='vim'
alias vi='vim'
alias vd='vim -d'
alias lock='i3lock -c 000000'
alias m='mkdir'
alias t='touch'
alias b='cd ../;l'
alias te='tar -xzvf'
alias ch='chmod a+x'
## gitstuff
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gs="git add .; git commit"
alias gm="git merge"
alias gmm="git merge master"
alias gr="git add .;git reset --hard"
alias ga="git add ."
alias gp="git push origin HEAD"
alias gb="git branch"
alias gc="git checkout"
alias gcm="git checkout master"
alias gnb="git checkout -b"
alias gdb="git branch -d"
alias gd="git difftool master"
## find
alias f="find . -iname"
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
## special c function
function c {
    builtin cd "$@" && l 
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
