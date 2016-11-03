# Path to your oh-my-zsh installation.
export ZSH=/home/phillipkobylinski/.oh-my-zsh
export UPDATE_ZSH_DAYS=7
#ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_THEME="gentoo"
ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"

plugins=(git vi-mode pip pylint)

source $ZSH/oh-my-zsh.sh

# ----- Enviroment Variables -----

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Language
export LANG=en_US.UTF-8

# History
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space

# Email
export EMAIL=""
export NAME=""
export SMTPSERVER=""

# Misc Variables
export TERM=screen-256color
export PATH=$PATH:$HOME/bin
export EDITOR=/usr/bin/vim

# ----- Aliases -----
alias l="ls"
alias sl="ls"
alias cl="clear"
alias lc="clear"
alias passgen="< /dev/urandom tr -dc _A-z-a-z-0-9 | head -c16 && echo ''"

# ----- Execs -----

# Tmux
if command -v tmux>/dev/null; then
	[[ $TERM != "screen" ]] && [ -z $TMUX ] && exec tmux -2
fi
