# Bash completion for Git (Homebrew Style)
# FIXME: Need a non-version specific way of handling this
COMPLETION=/usr/local/Cellar/git/1.7.9.2/etc/bash_completion.d/git-completion.bash
[[ -f $COMPLETION ]] && source $COMPLETION

export GIT_EDITOR='vim -f'

# Prompt Hacks
# TODO
