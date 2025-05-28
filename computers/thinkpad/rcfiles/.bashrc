# Increases cursor speed
[[ $- != *i* ]] && return
xset r rate 300 50

# Remove beeper
xset -b

# Blinking cursor
echo -e -n "\x1b[\x35 q" # changes to blinking bar

# Defaults
export EDITOR=vim
export VISUAL=vim
export TERMINFO=/usr/share/terminfo/
export TERMINAL=/bin/xterm

# Prompt configuration
export PS1="\[\e[01;36m\]\u@\h \[\e[01;32m\]\\w\[\e[01;\$(acolor)m\]\$(git_branch)\[\e[01;00m\] "

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Bash history
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth
HISTIGNORE='ls:history'
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
shopt -s histappend

# Naviage to prevous directory
if [ -f ~/.last_dir ]
	then cd $(cat ~/.last_dir)
fi

# fzf
eval "$(fzf --bash)"

# Aliases
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias l='ls -thr --color'
alias ll='ls -lthra --color'
alias lr='grep --color -E -- "$(ls -rtl | tail -n3)|$" <(ls -l)'
alias cod='cd ../code; ls -thr --color'
alias dat='cd ../data; ls -thr --color'
alias res='cd ../results; ls -thr --color'
alias lr='grep --color -E -- "$(ls -rtl | tail -n3)|$" <(ls -l)'
alias v='vim'
alias m='mkdir'
alias t='tmux'
alias own='sudo chown -R $USER:$USER'
alias w='watch -c -d'
alias wl='watch -c ls -ltha --color'
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
alias pyr='python $(ls -tr | tail -n 1)'
alias cr='cd $(ls -trd */ | tail -n 1)'
alias lock='i3lock -c 000000'
alias pt='python -m unittest discover -v'
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
alias wpw="watch -c pstree $(pgrep workforce) -apC age"
alias wpt="watch -c \" column -ts $'\t'\""
alias checktemp="watch -n 2 sensors"
alias starwars="telnet towel.blinkenlights.nl"
alias twineup="twine upload --repository-url https://upload.pypi.org/legacy/ dist/*"
alias wp="watch -c 'pstree -C age'"
alias wt="watch -c tree --du -hC"
alias rf="readlink -f"
alias dclean="docker system prune -a -f"
alias labbook="cd /run/media/theop/maindrive/todo/labbook/"
alias store='cd /run/media/theop/maindrive/ && ls -thr --color'
alias tool='cd /run/media/theop/maindrive/metatoolkit/ && ls -thr --color'
alias please='/usr/bin/sudo $(history -p !!)'
alias rss='newsboat'
alias ap='add_to_path'

# Custom functions
add_to_path() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
        echo "Added $1 to PATH"
    else
        echo "Directory does not exist: $1"
        return 1
    fi
}
c() {
    builtin cd $@ && l
    pwd > ~/.last_dir
}
o() {
    xdg-open "$@" & disown -a
}
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
# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

recent() {
  local cmd=$1
  shift

  local file
  file=$(find . -maxdepth 1 -type f -printf "%T@ %p\n" 2>/dev/null | sort -n | tail -n1 | cut -d' ' -f2-)

  if [ -n "$file" ]; then
    "$cmd" "$@" "$file"
  else
    echo "No recent file found." >&2
    return 1
  fi
}

# Python
export PYTHONBREAKPOINT=ipdb.set_trace

# >>> conda initialize >>>
#__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
## . "/opt/anaconda/etc/profile.d/conda.sh"  # commented out by conda initialize
#    else
## export PATH="/opt/anaconda/bin:$PATH"  # commented out by conda initialize
#    fi
#fi
#unset __conda_setup

# Exports
# Cytoscape
export PATH=$PATH:~/Cytoscape_v3.10.2/
export EXTRA_JAVA_OPTS="-Djdk.util.zip.disableZip64ExtraFieldValidation=true"

# Maaslin2
export PATH=$PATH:/run/media/theop/maindrive/github_programs/Maaslin2/R/

# sparcc
export PATH=$PATH:/run/media/theop/maindrive/github_programs/SparCC/

# literature-cli
export PATH=$PATH:/run/media/theop/maindrive/github_programs/literature-cli/

# colabfold
#export PATH=$PATH:~/localcolabfold/localcolabfold/colabfold-conda/bin/

# scripts
export PATH=$PATH:~/system/scripts/
export PATH=$PATH:~/bin/


