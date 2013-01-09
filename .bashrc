## 
# Dots
# http://www.github.com/mgirouard/Dots
##

# Bash completion for Git (Homebrew Style)
# FIXME: Need a non-version specific way of handling this
GC=/usr/local/Cellar/git/1.7.9.2/etc/bash_completion.d/git-completion.bash
if [ -r $GC ]; then . $GC; fi

# A minimal prompt
# Show the current working directory name and nothing else
if [ $EUID -eq 0 ]; then PC=31; else PC=36; fi
PS1="\[\033[1;"$PC"m\]\W\[\033[0m\] "

# Behave like VI
set -o vi

# Aliases
alias ls='ls -G'
alias ll='ls -la'
alias vi='vim'
alias v='vim .'

# Source env-specific stuff
if [ -d ~/.bashrc.d ]; then
    for RC in `ls ~/.bashrc.d/*.sh`; do . $RC; done
fi

# Remember a lot of history
HISTFILESIZE=10000
