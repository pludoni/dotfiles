setup_linux:
	cd /tmp
	wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.1-2_all.deb
	sudo dpkg -i rcm_1.2.1-2_all.deb
	rm rcm_1.2.1-2_all.deb
	cd ~/.dotfiles
	rcup

setup:
	rcup

rebuild_zsh_completion:
	rm -f ~/.zcompdump
	compinit

zsh:
	curl -L https://github.com/pludoni/oh-my-zsh/raw/master/tools/install.sh | sh

tmux:
	mkdir -p ~/.tmux
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect
