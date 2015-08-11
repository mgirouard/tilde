Tilde
=====
Yet another dotfiles repository.

Chances are, if you're here you know what to do with these. Otherwise, clone then `make`.

Setup
-----
Clone into the place where you normally put useful vendor stuff:

    git clone https://github.com/mgirouard/tilde.git ~/Projects/tilde

You can symlink files manually or go all in and do what I do:

    cd !$ && make

The `Makefile` just symlinks everything into your `$HOME` by default. You can
specify a different place if you prefer:

    make PREFIX=/etc/skel
