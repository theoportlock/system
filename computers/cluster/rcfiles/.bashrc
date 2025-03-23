# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable pip
source ~/venv/bin/activate

# shortcut aliases
alias l='ls -tr --color=auto'
alias v='vim'
alias m='mkdir'
alias t='touch'
alias z='zsh'
alias b='cd ../;l'
alias r='mv -t /tmp'
alias p='python3'
alias pip='pip3'
alias f="find . -iname"
alias h="history"
alias re='ls -tr | tail -n 1'
alias pt='python -m unittest discover -v'
alias te='mkdir -p extract; tar -C extract -xzvf' 
alias ch='chmod a+x'
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
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
alias xc="xclip -sel clip"
alias tree="tree -C"
alias wf="~/workforce/workforce.py"

c() {
    builtin cd $@ && l
}
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}
function cpr() {
  rsync --archive -hh -zrav --delete --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
}
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}

export PATH=$PATH:~/system/scripts/
export PATH=$PATH:~/.local/bin/
export PYTHONBREAKPOINT=ipdb.set_trace
export VISUAL=vim
export EDITOR="$VISUAL"
export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "
export SCRATCH=/scratch/users/k1809704/
export CHMI=/mnt/lustre/groups/chmi/
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
