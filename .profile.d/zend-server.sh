export ZEND=/usr/local/zend
export MYSQL=$ZEND/mysql

export PATH=$ZEND/bin:$MYSQL/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ZEND/bin

alias zs='sudo zendctl.sh'
alias zsfixmysql="sudo ln -s $ZEND/tmp/mysql.sock /tmp/mysql.sock"
