# ----- Command Aliases --------------------------------------------------------

alias ll='ls -l'
alias la='ls -la'
alias vi=vim
alias gdiff='git diff --color'
alias gstat='git status'
alias zf="zf.sh"

# ----- Local Apps -------------------------------------------------------------

LOCAL_BIN=/Users/mgirouard/Scripts

# ----- JavaScript  ------------------------------------------------------------

export NARWHAL_ENGINE=jsc
export PATH="/usr/local/narwhal/bin:$PATH"
export CAPP_BUILD='/Users/mgirouard/Sites/Cappuccino'

# ----- ZEND  ------------------------------------------------------------------

export ZROOT=/usr/local/zend
export ZFROOT=$ZROOT/share/ZendFramework
export MYROOT="$ZROOT/mysql"
export AROOT="$ZROOT/apache2"
export HTDOCS="$AROOT/htdocs"
export MYHTDOCS="/Users/mgirouard/Sites"
export PATH="$ZROOT/bin:$MYROOT/bin:$AROOT/bin:$PATH:$ZFROOT/bin"
source /etc/zce.rc

# ----- MongoDB  ------------------------------------------------------------------

export MONGOROOT=/usr/local/mongodb
export PATH="$MONGOROOT/bin:$PATH"

# ----- Subversion -------------------------------------------------------------

SVN_EDITOR=vi
SVN_PATH=/opt/subversion/bin

# ----- Mac Ports --------------------------------------------------------------

export PATH=$PATH:/opt/local/bin
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info

# ----- Path Configuration -----------------------------------------------------

PATH=$ZEND_PATH:$LOCAL_BIN:$MYSQL_PATH:$SVN_PATH:$PATH

export SVN_EDITOR
export PATH