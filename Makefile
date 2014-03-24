setup:
	cd /tmp
	wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.1-2_all.deb
	sudo dpkg -i rcm_1.2.1-2_all.deb
	cd ~/.dotfiles
	rcup


zsh:
	curl -L https://github.com/pludoni/oh-my-zsh/raw/master/tools/install.sh | sh
