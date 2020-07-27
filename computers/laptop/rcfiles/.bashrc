# If not running interactively, don't do anything
[[ $- != *i* ]] && return
xset r rate 300 50
setxkbmap gb

# shortcut aliases
alias l='ls --color=auto'
alias v='vim'
alias vi='vim'
alias lock='i3lock -c 000000'
alias m='mkdir'
alias t='touch'
alias b='cd ../;l'
alias te='tar -xzvf'
alias ch='chmod a+x'
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -Rns'
alias p='python3'
alias ipython='python -m IPython'
alias ve='source venv/bin/activate'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gs="git add .; git commit"
alias gr="git add .;git reset --hard"
alias gpush="git push --all origin"
alias gpull="git pull --all"
alias gcm="git checkout master"
alias gdb="git branch -d"
alias gdm="git difftool master"
alias gdf="git difftool feature"
alias gspull="git subtree pull --prefix tester https://github.com/theoportlock/tester.git master --squash"
alias gspush="git subtree push --prefix tester https://github.com/theoportlock/tester.git master" 
alias f="find . -iname"
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
alias xc="xclip -sel clip"
alias r='mv -t /tmp'
alias poweroff="sync; poweroff"
alias reboot="sync; reboot"
alias wf="~/workforce/workforce.py"
alias checktemp="watch -n 2 sensors"
alias starwars="telnet towel.blinkenlights.nl"

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

export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "

# bash history
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
