# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls --color=auto -rth'
alias v='vim'
alias m='mkdir'
alias t='touch'
alias b='cd ../;l'
alias te='tar -xzvf'
alias ch='chmod a+x'
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -Rns'
alias tks='tmux kill-server'
alias p='python'
alias va='source venv/bin/activate'
alias venv='python -m venv venv'
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
alias poweroff="sync; sudo poweroff"
alias tree='tree -C'
alias starwars="telnet towel.blinkenlights.nl"
alias temp="sudo vcgencmd measure_temp"

function c {
    builtin cd "$@" && l 
    }

goo() {
    IFS=+ w3m https://google.com/search?hl=en\&q="$*"\&btnI= https://google.com/search?hl=en\&q="$*"
}

wiki() {
    IFS=+ w3m https://en.wikipedia.org/w/index.php?search="$*"
}

export PATH=$PATH:~/system/scripts/

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}

export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "

HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'

[ -z "$TMUX" ] && { tmux attach || exec tmux new-session -A -s main && exit;}
