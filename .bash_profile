## 
# Dots
# http://www.github.com/mgirouard/Dots
##

for SCRIPT in `ls $HOME/.profile.d`; do
    source "$HOME/.profile.d/$SCRIPT"
done

[[ `which fortune` != "" ]] && echo && fortune -a && echo
