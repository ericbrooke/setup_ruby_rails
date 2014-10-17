# group write permission needed for homebrew
# to write new brews if using mutiple accounts on the same machine
umask 0002

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Define bash colours
source ~/.bash_colours.bash

# Setup Git completion
source ~/.git-completion.bash

# Bash prompt -> Modify command line format and colours 
export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(~/.rvm/bin/rvm-prompt v p g s)) \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"


# alias

alias coverage="open ./coverage/index.html"
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h=history
