## 
# Dots
# http://www.github.com/mgirouard/Dots
##

# Bash completion for Git
GC=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -r $GC ]; then . $GC; fi

function parse_git_branch { 
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
} 

if [ $EUID -eq 0 ]; then PC=31; else PC=36; fi
PS1="\[\033[1;"$PC"m\]\h::\W\[\033[0m\] \$(parse_git_branch) "

# Aliases
if [ `uname` == Linux ]; then
    LSCOLOR='--color=auto'
elif [ `uname` == Darwin ]; then
    LSCOLOR='-G'
fi

alias ls="ls $LSCOLOR"
alias ll='ls -la'
alias vi='vim'
alias v='vim .'
alias php='php-cli'
alias grep='grep --color'

# Source env-specific stuff
if [ -d ~/.bashrc.d ]; then
    for RC in `ls ~/.bashrc.d/*.sh`; do . $RC; done
fi

# Remember a lot of history
HISTFILESIZE=10000
