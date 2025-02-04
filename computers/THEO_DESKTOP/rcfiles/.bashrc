# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# start X application on windows by runing xming and selecting the no access control option
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
#export DISPLAY=127.0.0.1:0.0
#export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0

# shortcut aliases
alias l='ls --color=auto -lrth'
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
alias pu='sudo apt update && sudo apt upgrade'
alias pr='sudo pacman -Rns'
alias tks='tmux kill-server'
alias p='python3'
alias ve='source venv/bin/activate'
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
alias mu="sudo mount /dev/sdc2 /mnt"
alias umu="sudo umount /mnt"
alias f="find . -iname"
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
alias xc="xclip -sel clip"
alias r='mv -t /tmp'
alias poweroff="sync; poweroff"
alias pms="export PATH=$PATH:/home/theo/proteintools/scripts"
alias pms-ls="ls ~/proteintools/scripts"
alias starwars="telnet towel.blinkenlights.nl"
alias hom="cd /mnt/c/Users/User/"

## special functions
c() {
    builtin cd "$@" && l 
    }

goo() {
    IFS=+ w3m https://google.com/search?hl=en\&q="$*"\&btnI= https://google.com/search?hl=en\&q="$*"
}

syn() {
	rclone sync $1: ~/$1
}

wiki() {
    IFS=+ w3m https://en.wikipedia.org/w/index.php?search="$*"
}

wo() {
	powershell.exe -Command Start-Process $(wslpath -wa $1)
}

# scripts
export PATH=$PATH:~/system/scripts/
export PATH=$PATH:/home/theo/.local/bin/

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

# for i3
export DISPLAY=localhost:0
