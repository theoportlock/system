# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shortcut aliases
alias l='ls -thr --color'
alias o='open'
alias ll='ls -lthra --color'
alias lr='grep --color -E -- "$(ls -rtl | tail -n3)|$" <(ls -l)'
alias v='vim'
alias m='mkdir'
alias t='tmux'
alias w='watch --color'
alias z='zsh'
alias b='cd ../;l;pwd > ~/.last_dir'
alias r='mv -t /tmp'
alias f='find . -iname '
alias j='jobs -l'
alias p='python'
alias par='time parallel -j+0 --eta'
alias d='dirs -v'
alias f="find . -iname"
alias h="history"
alias re='ls -tr | tail -n 1'
alias vr='vim $(ls -tr | tail -n 1)'
alias cr='cd $(ls -trd */ | tail -n 1)'
alias lock='i3lock -c 000000'
alias pt='python -m unittest discover -v'
alias te='mkdir -p extract; tar -C extract -xzvf' 
alias ch='chmod a+x'
alias pi='brew install'
alias pu='brew update; brew upgrade'
alias pr='brew uninstall'
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
alias poweroff="sync; poweroff"
alias reboot="sync; reboot"
alias tree="tree -C"
alias checktemp="watch -n 2 sensors"
alias starwars="telnet towel.blinkenlights.nl"
alias twineup="twine upload --repository-url https://upload.pypi.org/legacy/ dist/*"
alias wp="watch -c 'pstree -C age'"
alias wt="watch -c tree --du -hC"
alias rf="readlink -f"
alias store="cd /Volumes/maindrive"
alias labbook="cd /Volumes/maindrive/todo/labbook/"

function matlab {
	/Applications/MATLAB*.app/bin/matlab -nodisplay -nosplash -nodesktop -r "try, run(\"$(readlink -f test.m)\"), catch, exit, end, exit"
}

c() {
    builtin cd $@ && l
    pwd > ~/.last_dir
}

if [ -f ~/.last_dir ]
	then cd $(cat ~/.last_dir)
fi

gdestroy() {
	git filter-branch --force --index-filter "git rm --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
}

function ppssh {
	parallel --nonall --progress -S moto,moto_old,moto_old_old,sony,tablet tmux send-keys -t main \""${*:1}"\" ENTER
}
function pssh {
	ssh $1 tmux send-keys -t main \""${*:2}"\" ENTER
}
function pd {
	pushd $@ && l
}
function pod {
	popd && l
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
	rsync -aurvP "$@"
}
function mvr() {
	rsync -aurvP --remove-source-files "$@"
}
#function mvr() {
#	rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
#}

# scripts
export PATH=$PATH:~/system/scripts/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/metatoolkit/
export PATH=$PATH:~/tsv-utils/bin

# python
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"

# meteor
export PATH=$PATH:~/postdoc/meteor/

# Maaslin2
export PATH=$PATH:/Volumes/maindrive/github_programs/Maaslin2/R/

# python
export PYTHONBREAKPOINT=ipdb.set_trace

# default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# better autocomplete
# bind 'set show-all-if-ambiguous on'
# bind "\"\\eOQ\":\"\e[1~ls;#\\n\""

# prompt configuration
export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "

# for brew
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# bash history
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'

# for stupid matlab
export ILOG_CPLEX_PATH="/Applications/CPLEX_Studio221"


