PREFIX ?= ~
PLATFORM = $(shell uname -s | tr A-Z a-z)
PROJECT = $(shell pwd)
BINDIR = $(PREFIX)/bin

DIRS = $(BINDIR)     \
	   $(PREFIX)/src \
	   $(PREFIX)/.bashrc.d

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

install: $(DIRS) $(SYMLINKS) $(PLATFORM)

# Ensure connon directories exist
$(DIRS):
	mkdir -p $@

# Install symlinks
$(SYMLINKS):
	ln -s $(PROJECT)/$(@F) $@

# Cleanup/uninstall
clean:
	@for l in $(SYMLINKS); do \
		if [ -e $$l ]; then   \
			rm $$l;           \
		fi;                   \
	done

include $(PLATFORM).mk
