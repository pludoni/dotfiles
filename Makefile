setup:
	cd /tmp
	wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.1-2_all.deb
	sudo dpkg -i rcm_1.2.1-2_all.deb
	rm rcm_1.2.1-2_all.deb
	cd ~/.dotfiles
	rcup


zsh:
	curl -L https://github.com/pludoni/oh-my-zsh/raw/master/tools/install.sh | sh

vim:
	\curl -L https://raw.github.com/zealot128/vimfiles2/master/install.sh | bash

ubuntu:
	sudo apt-get install curl git-core vim zsh tmux

ruby:
	\curl -sSL https://get.rvm.io | bash -s stable

node:
	sudo apt-get install python-software-properties python g++ make
	sudo add-apt-repository ppa:chris-lea/node.js
	sudo apt-get update --yes
	sudo apt-get install nodejs
	sudo npm install -g cordova
