mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))

rebuild_zsh_completion:
	rm -f ~/.zcompdump
	compinit

zsh:
	curl -L https://github.com/pludoni/oh-my-zsh/raw/master/tools/install.sh | sh

tmux:
	mkdir -p ~/.tmux
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect

link:
	-ln -fs ${CURDIR}/gitconfig ~/.gitconfig
	-ln -fs ${CURDIR}/gitignore ~/.gitignore
	-ln -fs ${CURDIR}/wgetrc ~/.wgetrc
	-ln -fs ${CURDIR}/bash_aliases ~/.bash_aliases
	# -ln -fs ${CURDIR}/bashrc ~/.bashrc
	-ln -fs ${CURDIR}/tmux.conf ~/.tmux.conf
	-ln -fs ${CURDIR}/railsrc ~/.railsrc

vimfiles:
	\curl -L https://raw.github.com/zealot128/vimfiles2/master/install.sh | bash

all: link tmux zsh
