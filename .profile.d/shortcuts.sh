##
# Shortcuts
# http://www.github.com/mgirouard/Dots
##

# Command Aliases
alias ls='ls -G'
alias ll='ls -la'
alias vi='vim'
alias v='vim .'

# Generic "Go to" shortcut with some bonus conveniences
function gt () 
{
    pushd $1 > /dev/null
    ls -a
    [[ -d ".git" ]] && git status
}

# "go to" goes well with this "go back" alias
alias gb='popd > /dev/null'

# Common Paths
export PROJECTS=$HOME/Documents/Projects
export VENDORS=$HOME/Documents/Vendors
export SITES=$HOME/Sites
export PROFILE=$HOME/.profile.d

# User Scripts
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
