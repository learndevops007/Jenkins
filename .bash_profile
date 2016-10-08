# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
 . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

function prompt {
  local GREEN="\[\033[0;32m\]"
  local PURPLE="\[\033[0;35m\]"
  local CYAN="\[\033[0;36m\]"
  export PS1="$CYAN\u@$PURPLE\h\[\033[00m\]:$GREEN\w\[\033[00m\] \\$ "
}
prompt

export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:$PATH"
export BLOCKSIZE=1k

alias vi="vim"
alias ls="ls -latr --color=auto"
alias ll="ls -latr --color=auto"
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
