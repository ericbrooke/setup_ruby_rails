# group write permission needed for homebrew
# to write new brews if using mutiple accounts on the same machine, uncomment the next line if you wish it
# umask 0002

# Define bash colours
source ~/.bash_colours.bash

# Setup Git completion
source ~/.git-completion.bash

# Bash prompt -> Modify command line format and colours 
# with no ruby version or ruby management systems
export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\] \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"

# for use with rvm
#export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(~/.rvm/bin/rvm-prompt v p g s)) \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"

# for use with rbenv
#export PS1="\[\033[1;30m\][\[\033[1;35m\]\u@\h\[\033[1;30m\]] \[\033[1;32m\]\w \[\033[1;31m\](\$(rbenv version-name)) \$(__git_ps1 [%s]) \n  \[\033[1;30m\]\$\[\033[0m\]"

# alias bash
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h=history

# alias git
alias gs="git status"
alias gco= "git checkout"

# alias test coverage
alias coverage="open ./coverage/index.html"

# for rails dev
alias rakenuke="bin/rake db:{drop,create,migrate,seed,test:prepare}"

# Add RVM to PATH for scripting
# export PATH="$PATH:$HOME/.rvm/bin"
