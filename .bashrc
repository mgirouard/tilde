## 
# Dots
# http://www.github.com/mgirouard/Dots
##

# Bash completion
# -----------------------------------------------------------------------------
if [ -d /usr/local/etc/bash_completion.d ]; then
    source /usr/local/etc/bash_completion.d/*
fi

# Prompt
# -----------------------------------------------------------------------------
function parse_git_branch { 
    local b=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    [[ $b ]] && echo -n -e "\033[0m"" ⎇  \033[1;32m"$b"\033[0m "
    [[ `which git-branch-status` ]] && git branch-status
}

function generate_PS1() {
    exitval=$?
    PS1="\[\e[0;33m\]\w\$(parse_git_branch)\[\e[0m\] \nλ ($exitval) "
}

export PROMPT_COMMAND=generate_PS1

# Environment
# -----------------------------------------------------------------------------

# Ensure color when listing directory contents
if [ `uname` == Linux ]; then
    LSCOLOR='--color=auto'
elif [ `uname` == Darwin ]; then
    LSCOLOR='-G'
fi

# Remember a lot of history
HISTFILESIZE=10000

export TERM=screen-256color
export ANSIBLE_HOSTS=./production
export GOPATH=$HOME

# Aliases
# -----------------------------------------------------------------------------
alias ls="ls $LSCOLOR"
alias ll='ls -la'
alias vi='vim'
alias v='vim .'
alias grep='grep --color'
alias tmux='tmux -2'
alias pubkey='cat ~/.ssh/id_rsa.pub'

# Utilities
# -----------------------------------------------------------------------------
grepf() { tail -f $1 | grep --line-buffered $2; }

# Source env-specific stuff
# -----------------------------------------------------------------------------
if [ -d ~/.bashrc.d ]; then
    for RC in `ls ~/.bashrc.d/*.sh`; do . $RC; done
fi
