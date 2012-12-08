## 
# Dots
# http://www.github.com/mgirouard/Dots
##

# Initialize login shell
if [ -r ~/.profile ]; then . ~/.profile; fi

# Initialize interactive shell
if [ -n "$PS1" -a -r ~/.bashrc ]; then . ~/.bashrc; fi
