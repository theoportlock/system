[[ -f ~/.bashrc ]] && . ~/.bashrc

# Seq compiler path (added by install script)
export PATH=/Users/theoportlock/.seq/bin:$PATH
export BASH_SILENCE_DEPRECATION_WARNING=1

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

