# ~/.bashrc: executed by bash(1) for non-login shells.
export PS1='\h:\w\$ '
umask 022
# You may uncomment the following lines if you want `ls' to be colorized:
alias ll='ls -l'
alias l='ls -lA'

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    if [[ $EUID -ne 0 ]]; then
      color="32"
    else
      color="37"
      if [ `hostname`  == "km34029.keymachine.de" ]; then
        color="33"
      fi

    fi
    PS1='\[\e[1;'$color'm\]\u@\h:\w\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export SVN_EDITOR=nvim
export EDITOR=nvim
#PS1='\[\033[33m\]\w\n\u@\h\$\[\033[39m\] '
#PS1='--- \[\033[36m\]\w\n\[\033[33m\]\u@\h$\[\033[39m\] '

# . ~/.completion/load.sh

export LANG="de_DE.UTF-8"
export LC_CTYPE="de_DE.UTF-8"
export LANGUAGE="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

export LC_MESSAGES="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"

#activate 256 colors
export TERM='screen-256color'
export TERM='xterm-256color'

export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# added by travis gem
[ -f /Users/stefan/.travis/travis.sh ] && source /Users/stefan/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f ~/.cargo/env ] && source ~/.cargo/env
