PREFIX ?= ~
PROJECT = $(shell pwd)
SYMLINKS = $(PREFIX)/.bash_profile  \
		   $(PREFIX)/.bashrc        \
		   $(PREFIX)/.gitignore     \
		   $(PREFIX)/.inputrc       \
		   $(PREFIX)/.php.tools.ini \
		   $(PREFIX)/.profile       \
		   $(PREFIX)/.tmux.conf     \
		   $(PREFIX)/.vim           \
		   $(PREFIX)/.vimrc         \
		   $(PREFIX)/.xinitrc

.DEFAULT: install
.PHONY: install clean

install: dirs $(SYMLINKS)

dirs:
	mkdir -p $$HOME/bin
	mkdir -p $$HOME/.bashrc.d

# Install symlinks
$(SYMLINKS): clean
	ln -s $(PROJECT)/$(@F) $@

# Cleanup/uninstall
clean:
	@for l in $(SYMLINKS); do \
		if [ -e $$l ]; then   \
			rm $$l;           \
		fi;                   \
	done
