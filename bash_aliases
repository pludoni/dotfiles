alias b="bundle exec"

alias dusch="du -sch * | egrep '[MG]'"
alias git-unpushed="git log origin/master..HEAD"

export EDITOR="vim"
alias ta="tmux attach"
alias ctags-refresh='ctags --extra=+f -f .tags --languages=Ruby --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*'
alias shortdig="dig ANY  +nocl +recurse +nocmd +nostats +noquestion +nocomments +answer"
alias ssh-agent-start='eval `ssh-agent` && ssh-add -t600'
alias v=nvim
alias vi=nvim

uname -a | grep "Darwin" > /dev/null
if [ $? -eq 0 ]
then
  alias dns-reload='sudo killall -HUP mDNSResponder'
  alias stop-sleep='echo "Stopping computer from going into sleep, stop with ctrl+c" && pmset noidle'
  alias pg-reload='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

  function ffmpeg-screencast() {
    ffmpeg -r 30 -f avfoundation -capture_cursor 1 -capture_mouse_clicks 1 -i "1:0" $1
  }
fi


function ffmpeg-mp4-hd() {
  ffmpeg -i $1 -preset veryfast -c:v libx264 -profile:v main -level 4 -c:a libfaac -q:a 100 -crf 25 -map_metadata 0 encoded_$1
  echo "Before:"
  du -h $1
  echo "After:"
  du -h encoded_$1
}
function ffprobe-json() {
  ffprobe -show_format -print_format json $1 2> /dev/null
}



alias tracking-start='while true; do ~/bin/thyme track -o ~/.thyme.json; sleep 30s; done;'
alias tracking-show='~/bin/thyme show -i ~/.thyme.json -w stats > ~/.thyme.html && open ~/.thyme.html'
alias tmux-clear-all='tmux list-windows -t CRM|grep -v vim|cut -d: -f1|xargs -I{} tmux send-keys -t CRM:{} C-l '

alias ssh-agent-start='eval `ssh-agent` && ssh-add -t3600'
alias v=vim
alias vi=vim


