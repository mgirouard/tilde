##
# Zend Server
# http://www.github.com/mgirouard/Dots
##

# Zend Server
export ZEND_ROOT=/usr/local/zend
export PATH=$ZEND_ROOT/bin:$PATH

# HTTPd 
export HTTP_ROOT=$ZEND_ROOT/apache2
export HTTP_CONF=$HTTP_ROOT/conf
export HTTP_DOCS=$HTTP_ROOT/htdocs

# MySQL
export MYSQL_ROOT=$ZEND_ROOT/mysql
export PATH=$MYSQL_ROOT/bin:$PATH

alias zs='sudo zendctl.sh'
