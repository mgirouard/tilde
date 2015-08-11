PREFIX ?= ~
PROJECT = $(shell pwd)
SYMLINKS = $(PREFIX)/.bash_profile \
		   $(PREFIX)/.bashrc       \
		   $(PREFIX)/.inputrc      \
		   $(PREFIX)/.profile      \
		   $(PREFIX)/.tmux.conf    \
		   $(PREFIX)/.vim          \
		   $(PREFIX)/.vimrc        \
		   $(PREFIX)/.xinitrc

.DEFAULT: install
.PHONY: install clean

install: $(SYMLINKS)

# Install symlinks
$(SYMLINKS): clean
	ln -s $(PROJECT)/$(@F) $@

# Cleanup/uninstall
clean:
	@for l in $(SYMLINKS); do \
		if [[ -e $$l ]]; then \
			rm $$l;    		  \
		fi;                   \
	done
