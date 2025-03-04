export TERM=xterm-256color

# Initialize completion
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

# Emacs keybindings
bindkey -e

export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

unsetopt correct_all
unsetopt correct

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /usr/share/autojump/autojump.sh

export PATH="./bin:./node_modules/.bin:$PATH"

if [[ "$(ps -u $USER | grep ssh-agent | wc -l)" -lt "1" ]]; then
  echo "$(date +%F@%T) - SSH-AGENT: Agent will be started"
  # Start the ssh-agent and redirect the environment variables into a file
  ssh-agent -s >~/.ssh/ssh-agent
  # Load the environment variables from the file
  . ~/.ssh/ssh-agent >/dev/null
  # Add the default key to the ssh-agent
  echo "SSH-Agent: Add Key with ssh-add -t 28800 ~/.ssh/id_rsa"
  # ssh-add ~/.ssh/id_rsa
else
  echo "$(date +%F@%T) - SSH-AGENT: Agent already running"
  . ~/.ssh/ssh-agent >/dev/null
fi

# Aliases
alias g='git'
compdef g=git
alias gst='git status -sb'
compdef _git gst=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gp='git push'
compdef _git gp=git-push
alias gc='git commit -v'
compdef _git gc=git-commit
alias ga='git add'
compdef _git ga=git-add

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

function gcm() {
  git commit -m "$*"
}

eval "$(starship init zsh)"

. $HOME/.asdf/asdf.sh
. /home/swi/.asdf/completions/asdf.bash
