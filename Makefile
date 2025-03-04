mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))

tmux:
	mkdir -p ~/.tmux
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect

link:
	- ln -fs ${CURDIR}/gitconfig ~/.gitconfig
	- ln -fs ${CURDIR}/gitignore ~/.gitignore
	- ln -fs ${CURDIR}/wgetrc ~/.wgetrc
	- ln -fs ${CURDIR}/bash_aliases ~/.bash_aliases
	# -ln -fs ${CURDIR}/bashrc ~/.bashrc
	- ln -fs ${CURDIR}/tmux.conf ~/.tmux.conf
	- ln -fs ${CURDIR}/railsrc ~/.railsrc
	- ln -fs ${CURDIR}/pryrc ~/.pryrc
	- mkdir -p ~/.config
	- ln -fs ${CURDIR}/starship.toml ~/.config/starship.toml
	- ln -fs ${CURDIR}/zshrc ~/.zshrc

nvim:
	- git clone https://github.com/zealot128/nvim-files.git ~/.config/nvim
	- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


all: link tmux
