# shortcut aliases
alias l='ls -tr --color=auto'
alias v='vim'
alias vi='vim'
alias lock='i3lock -c 000000'
alias m='mkdir'
alias t='touch'
alias b='cd ../;l'
alias r='mv -t /tmp'
alias v='vim'
alias p='python3'
alias pt='python3 -m unittest discover -v'
alias te='tar -xzvf'
alias ch='chmod a+x'
alias pi='apt-get install'
alias pu='apt-get update && apt-get upgrade'
alias pr='apt-get remove'
alias p='python3'
alias ipython='python -m IPython --no-confirm-exit'
alias va='source venv/bin/activate'
alias venv='python3 -m venv venv'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gs="git add .; git commit"
alias gr="git add .;git reset --hard"
alias gpush="git push --all origin"
alias gpull="git pull --all"
alias gcm="git checkout master"
alias gcf="git checkout feature"
alias gd="git difftool"
alias gspull="git subtree pull --prefix tester https://github.com/theoportlock/tester.git master --squash"
alias gspush="git subtree push --prefix tester https://github.com/theoportlock/tester.git master" 
alias f="find . -iname"
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
alias xc="xclip -sel clip"
alias poweroff="sync; poweroff"
alias reboot="sync; reboot"
alias wf="~/workforce/workforce.py"
alias checktemp="watch -n 2 sensors"
alias starwars="telnet towel.blinkenlights.nl"

c() {
    builtin cd "$@" && l 
    }
goo() {
    IFS=+ w3m https://google.com/search?hl=en\&q="$*"\&btnI= https://google.com/search?hl=en\&q="$*"
}
wiki() {
    IFS=+ w3m https://en.wikipedia.org/w/index.php?search="$*"
}
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}
function cpr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
}
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}

# scripts
export PATH=$PATH:~/system/scripts/

# ipdb
export PYTHONBREAKPOINT=ipdb.set_trace

# better autocomplete
bind 'set show-all-if-ambiguous on'

# prompt configuration
export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "

# bash history
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
