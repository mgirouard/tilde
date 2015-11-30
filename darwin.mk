.PHONY: darwin
darwin: homebrew homebrew-cask

homebrew:
	@echo FIXME: Installing homebrew

homebrew-cask:
	@echo FIXME: Installing homebrew-cask

.PHONY: ack
ack:
	brew install ack
#	curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack
#	chmod +x ~/bin/ack

.PHONY: composer
composer:
#	curl -sS https://getcomposer.org/installer \
#		| php -- --install-dir=$(BINDIR) --filename=composer

.PHONY: ctags
ctags:
	brew install ctags

.PHONY: dnsmasq
dnsmasq:
	brew install dnsmasq

.PHONY: git
git:
	brew install git

.PHONY: go
go:
	brew install go

.PHONY: iterm2
iterm2:
	brew cask install iterm2

.PHONY: keepassx
keepassx:
	brew cask install keepassx

.PHONY: markdown
markdown:
	brew install markdown

.PHONY: node
node:
	brew install node

.PHONY: spectacle
spectacle:
	brew cask install spectacle

.PHONY: tmux
tmux:
	brew install tmux
	brew install reattach-to-user-namespace

.PHONY: virtualbox
virtualbox:
	brew cask install virtualbox
