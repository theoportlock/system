#
# ~/.bashrc
#

[[ $- != *i* ]] && return
xset r rate 300 50

#remove beeper
xset -b

# shortcut aliases
alias l='ls -thr --color'
alias ll='ls -lthra --color'
alias lr='grep --color -E -- "$(ls -rtl | tail -n3)|$" <(ls -l)'
alias v='vim'
alias m='mkdir'
alias t='touch'
alias own='sudo chown -R $USER:$USER'
alias w='watch -c -d'
alias z='zsh'
alias b='cd ../;l;pwd > ~/.last_dir'
alias r='mv -t /tmp'
alias f='find . -iname '
alias j='jobs -l'
alias p='python3'
alias par='time parallel -j+0 --eta'
alias d='dirs -v'
alias f="find . -iname"
alias h="history | tail -n 30"
alias re='ls -tr | tail -n 1'
alias vr='vim $(ls -tr | tail -n 1)'
alias cr='cd $(ls -trd */ | tail -n 1)'
alias lock='i3lock -c 000000'
alias pt='python -m unittest discover -v'
#alias te='mkdir -p extract; tar -C extract -xzvf' 
alias te='tar --one-top-level -xvf'
alias tz='tar -czvf archive.tar.gz' 
alias ch='chmod a+x'
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -Rns'
alias ipython='python -m IPython --no-confirm-exit'
alias va='source venv/bin/activate'
alias venv='python3 -m venv venv'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gs="git add .; git commit"
alias gr="git add .;git reset --hard"
alias gcm="git checkout master"
alias gcf="git checkout feature"
alias gd="git difftool"
alias fr="find . -not -path '*/\.*' -type f -mtime -7"
alias xc="xclip -i -selection clipboard -f | xclip -i -selection primary"
alias poweroff="sync; poweroff"
alias reboot="sync; reboot"
alias tree="tree -C"
alias wf="workforce"
alias checktemp="watch -n 2 sensors"
alias starwars="telnet towel.blinkenlights.nl"
alias twineup="twine upload --repository-url https://upload.pypi.org/legacy/ dist/*"
alias wp="watch -c 'pstree -C age'"
alias wt="watch -c tree --du -hC"
alias rf="readlink -f"
alias dclean="docker system prune -a -f"
# conda activate:
source /opt/anaconda/bin/activate root
alias labbook="cd /run/media/theop/maindrive/todo/labbook/"
alias store='cd /run/media/theop/maindrive/'
alias ph="cd '/run/user/1000/gvfs/mtp:host=Google_Pixel_7_2B251FDH2004XA/Internal shared storage'"

c() {
    builtin cd $@ && l
    pwd > ~/.last_dir
}

o() {
    xdg-open "$@" & disown -a
}

if [ -f ~/.last_dir ]
	then cd $(cat ~/.last_dir)
fi

gdestroy() {
	git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
}

function ppssh {
	parallel --nonall --progress -S moto,moto_old,moto_old_old,sony,tablet tmux send-keys -t main \""${*:1}"\" ENTER
}
function pssh {
	ssh $1 tmux send-keys -t main \""${*:2}"\" ENTER
}
function pud {
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

# scripts
# need to sort this so it works with the mounted drive
export PATH=$PATH:~/system/scripts/

# omicsbuilder
# need to sort this so it works with the mounted drive
export PATH=$PATH:~/omicsbuilder/

# python
export PYTHONBREAKPOINT=ipdb.set_trace

# default editor
export EDITOR=vim
export VISUAL=vim

# better autocomplete
# bind 'set show-all-if-ambiguous on'
# bind "\"\\eOQ\":\"\e[1~ls;#\\n\""

# prompt configuration
export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "

# bash history
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'

# to fix cytoscape for some reason
export EXTRA_JAVA_OPTS="-Djdk.util.zip.disableZip64ExtraFieldValidation=true"
#export TERMINFO=/usr/share/terminfo/
export TERMINAL=/bin/xterm

conda activate yourenvname
