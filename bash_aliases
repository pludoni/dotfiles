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
alias vim=nvim
alias R='nocorrect b rspec'
alias gaump='git add -u && git commit && git push'
alias gca='git commit --amend --no-edit'
alias diff='diff --color -u'

rg=$(which rg)
if [ -x "$rg" ] ; then
  alias ag='rg'
  alias ack='rg'
fi


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

alias ssh-agent-add-day='ssh-add -t 28800 ~/.ssh/id_rsa'

function rubocop-autocorrect-safe() {
  cops="Style/AlignArray,Style/BracesAroundHashParameters,Style/ClosingParenthesisIndentation,Style/DefWithParentheses,Style/EmptyLineAfterMagicComment,Style/EmptyLineBetweenDefs,Style/EmptyLines,Style/EmptyLinesAroundAccessModifier,Style/EmptyLinesAroundBlockBody,Style/EmptyLinesAroundClassBody,Style/EmptyLinesAroundExceptionHandlingKeywords,Style/EmptyLinesAroundMethodBody,Style/EmptyLinesAroundModuleBody,Style/ExtraSpacing,Style/HashSyntax,Style/IndentAssignment,Style/IndentationWidth,Style/Lambda,Style/LeadingCommentSpace,Style/MethodDefParentheses,Style/MultilineBlockLayout,Style/MultilineHashBraceLayout,Style/MultilineMethodCallBraceLayout,Style/SpaceAfterColon,Style/SpaceAfterComma,Style/SpaceAroundEqualsInParameterDefault,Style/SpaceAroundKeyword,Style/SpaceAroundOperators,Style/SpaceBeforeBlockBraces,Style/SpaceBeforeBlockBraces,Style/SpaceBeforeComma,Style/SpaceInsideBlockBraces,Style/SpaceInsideBrackets,Style/SpaceInsideHashLiteralBraces,Style/SpaceInsideParens,Style/TrailingBlankLines,Style/TrailingWhitespace"
  rubocop -a --only $cops
}

function ram-killers() {
  ps -eo pmem,rss,user,pid,cmd | sort -k 1 -nr | egrep '(node|ruby|chrome|firefox)' | head -n 10
}

alias unlock-agent-1d='ssh-add -t 28800 ~/.ssh/id_rsa'
alias rebase-continue='git add -u && git rebase --continue'
function R() {
  if [ -f bin/spring ]
  then
    nocorrect bin/spring rspec "$@"
  else
    bundle exec rspec "$@"
  fi
}
function Rnf() {
  if [ -f bin/spring ]
  then
    nocorrect bin/spring rspec --next-failure "$@"
  else
    bundle exec rspec --next-failure "$@"
  fi
}
function Rof() {
  if [ -f bin/spring ]
  then
    nocorrect bin/spring rspec --only-failures "$@"
  else
    bundle exec  rspec --only-failures "$@"
  fi
}
function Rmig() {
  if [ -f bin/spring ]
  then
    nocorrect bin/spring rake db:migrate "$@"
  else
    bundle exec rails db:migrate "$@"
  fi
}
function Rrollback() {
  if [ -f bin/spring ]
  then
    nocorrect bin/spring rake db:rollback
  else
    bundle exec rails db:rollback
  fi
}
alias gau='git add -u'
alias S='bin/spring'
alias Smigrate='bin/spring rake db:migrate'
alias Srollback='bin/spring rake db:rollback'
alias Sgenerate='bin/spring rails g'
alias Sconsole='bin/spring rails c'
alias Sannotate='bin/spring rake annotate_models'
alias Sr='bin/spring rails'

alias ap='ansible-playbook'

function Secupdate() {
  # if first argument is rails
  if [ "$1" = "rails" ]
  then
    bundle update "$@" && git add Gemfile.lock && git commit -m "SecFix: $*" && git push
  else
    bundle update "$@" --conservative && git add Gemfile.lock && git commit -m "SecFix: $*" && git push
  fi
}

function compressPDF() {
  # create name $1.small.pdf
  filename="${1%.pdf}.small.pdf"
  fsize_before=$(du -h "$1" | cut -f1)
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -r150  -sOutputFile="$filename" "$1"
  fsize_after=$(du -h "$filename" | cut -f1)
  echo "compresses to $filename.small.pdf from $fsize_before to $fsize_after"
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
alias T='~/Projects/gems/extract_i18n/exe/extract-i18n -l de'
alias Tjs='~/Projects/gems/extract_i18n/exe/extract-i18n -l de -n js'
alias Tfix='bundle exec i18n-tasks normalize -p && bundle exec i18n-tasks translate-missing -f de -l en'
