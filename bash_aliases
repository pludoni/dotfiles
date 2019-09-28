alias b="bundle exec"

alias dusch="du -sch * | egrep '[MG]'"
alias git-unpushed="git log origin/master..HEAD"

export EDITOR="nvim"
alias ta="tmux attach"
alias ctags-refresh='ctags --extra=+f -f .tags --languages=Ruby --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*'
alias shortdig="dig ANY  +nocl +recurse +nocmd +nostats +noquestion +nocomments +answer"
alias ssh-agent-start='eval `ssh-agent` && ssh-add -t600'
alias v=nvim
alias vi=nvim
alias R='nocorrect b rspec'

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
  # libfaac maybe
  ffmpeg -i $1 -preset veryfast -c:v libx264 -profile:v main -level 4 -c:a libfdk_aac -q:a 100 -crf 25 -map_metadata 0 encoded_$1
  echo "Before:"
  du -h $1
  echo "After:"
  du -h encoded_$1
}
function ffmpeg-mp4-720() {
  # libfaac maybe
  ffmpeg -i $1 -preset veryfast -vf scale=-1:720 -c:v libx264 -profile:v main -level 4 -c:a libfdk_aac -q:a 100 -crf 25 -map_metadata 0 encoded_$1
  echo "Before:"
  du -h $1
  echo "After:"
  du -h encoded_$1
}
function ffmpeg-mp4-480() {
  # libfaac maybe
  ffmpeg -i $1 -preset veryfast -vf scale=-2:480 -c:v libx264 -c:a libfdk_aac -q:a 100 -crf 25 -map_metadata 0 encoded_$1
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

function rubocop-autocorrect-safe() {
  cops="Style/AlignArray,Style/BracesAroundHashParameters,Style/ClosingParenthesisIndentation,Style/DefWithParentheses,Style/EmptyLineAfterMagicComment,Style/EmptyLineBetweenDefs,Style/EmptyLines,Style/EmptyLinesAroundAccessModifier,Style/EmptyLinesAroundBlockBody,Style/EmptyLinesAroundClassBody,Style/EmptyLinesAroundExceptionHandlingKeywords,Style/EmptyLinesAroundMethodBody,Style/EmptyLinesAroundModuleBody,Style/ExtraSpacing,Style/HashSyntax,Style/IndentAssignment,Style/IndentationWidth,Style/Lambda,Style/LeadingCommentSpace,Style/MethodDefParentheses,Style/MultilineBlockLayout,Style/MultilineHashBraceLayout,Style/MultilineMethodCallBraceLayout,Style/SpaceAfterColon,Style/SpaceAfterComma,Style/SpaceAroundEqualsInParameterDefault,Style/SpaceAroundKeyword,Style/SpaceAroundOperators,Style/SpaceBeforeBlockBraces,Style/SpaceBeforeBlockBraces,Style/SpaceBeforeComma,Style/SpaceInsideBlockBraces,Style/SpaceInsideBrackets,Style/SpaceInsideHashLiteralBraces,Style/SpaceInsideParens,Style/TrailingBlankLines,Style/TrailingWhitespace"
  rubocop -a --only $cops
}


function gem-cd() {
  cd `bundle show $1`
}
# if type nvim > /dev/null 2>&1; then
#   alias vim='nvim'
# fi
function bundle-grep () {
  ag "$@" `bundle show --paths`
}
