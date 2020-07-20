# If not running interactively, don't do anything
[[ $- != *i* ]] && return
xset r rate 200 50
setxkbmap us

# shortcut aliases
alias l='ls --color=auto'
alias ra='ranger'
alias v='vim'
alias vi='vim'
alias lock='i3lock -c 000000'
alias fehsvg='feh --conversion-timeout 1'
alias m='mkdir'
alias t='touch'
alias b='cd ../;l'
alias te='tar -xzvf'
alias ch='chmod a+x'
alias pi='sudo apt-get install'
alias pu='sudo apt-get update && sudo apt-get upgrade'
alias pr='sudo apt remove'
alias tks='tmux kill-server'
alias p='python3'
alias ve='source venv/bin/activate'
alias janv5="/soft/scripts/jans_startup/lnv5"
alias nv5="/soft/all/nmrview5.2.2/nv5"
alias bbassign="/soft/all/nmrview5.2.2/nv5_bb"
alias scassign="/soft/all/nmrview5.2.2/nv5_sc"
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gs="git add .; git commit"
alias gm="git merge"
alias gmm="git merge master"
alias gr="git add .;git reset --hard"
alias ga="git add ."
alias gpush="git push --all origin"
alias gpull="git pull --all"
alias gb="git branch"
alias gc="git checkout"
alias gcm="git checkout master"
alias gcf="git checkout feature"
alias gnb="git checkout -b"
alias gdb="git branch -d"
alias gdm="git difftool master"
alias gdf="git difftool feature"
alias gspull="git subtree pull --prefix tester https://github.com/theoportlock/tester.git master --squash"
alias gspush="git subtree push --prefix tester https://github.com/theoportlock/tester.git master" 
alias umu="sudo umount /mnt"
alias f="find . -iname"
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
alias xc="xclip -sel clip"
alias r='mv -t /tmp'
alias poweroff="sync; poweroff"
alias reboot="sync; reboot"
alias pms="export PATH=$PATH:/home/theo/proteintools/scripts"
alias pms-ls="ls ~/proteintools/scripts"
alias starwars="telnet towel.blinkenlights.nl"
alias ccpnmr="/soft/ccpnmr/bin/analysis"
alias ts="~/tester/main.py"
alias checktemp="watch -n 2 sensors"

## special functions
c() {
    builtin cd "$@" && l 
    }

goo() {
    IFS=+ w3m https://google.com/search?hl=en\&q="$*"\&btnI= https://google.com/search?hl=en\&q="$*"
}

wiki() {
    IFS=+ w3m https://en.wikipedia.org/w/index.php?search="$*"
}

# scripts
export PATH=$PATH:~/system/scripts/

# change prompt colour
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}

# prompt configuration
export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "
# vim navigation commands

# bash history
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
