# Colors
# (via https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
# -----------------------------------------------------------------------------
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Bash completion
# -----------------------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
elif [ -d /usr/local/etc/bash_completion.d ]; then
    source /usr/local/etc/bash_completion.d/*
fi

# Prompt
# -----------------------------------------------------------------------------
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

function generate_PS1() {
    local extv=$?
    local user="\[$txtgrn\]\u\[$txtrst\]"
    local host="\[$txtcyn\]\H\[$txtrst\]"
    local path="\[$txtred\]\w\[$txtrst\]"
    local branch="\[$txtylw\]$('__git_ps1' " %s")\[$txtrst\]"
    local sep="·"

    PS1="[$user $host $path$branch]\n($extv): "
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
grepf() {
    tail -f $1 | grep --line-buffered $2;
}

# Source env-specific stuff
# -----------------------------------------------------------------------------
if [ -d ~/.bashrc.d ]; then
    for RC in `ls ~/.bashrc.d/*.sh`; do . $RC; done
fi
