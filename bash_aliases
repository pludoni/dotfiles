function plcd {
  cd `pl cd $@`
}

function plgoto {
  cd `pl goto $@`
}

alias b="bundle exec"
alias s="spring"
alias gr='cd `git root`'

alias hoursweek="/opt/bugtracker/script/runner -e production 'puts TimeEntry.find(:all, :conditions => [\"spent_on > ? and user_id = 1\", 7.days.ago]).sum{|i| i.hours}' 2> /dev/null"
alias php-codesmells="phpcs -n --standard=Drupal --report=summary --severity=5 --extensions=php,inc,module . | sort +1 -2 -nr | grep -v phpmailer | grep -v class.smtp | head"


alias dusch="du -sch * | egrep '[MG]'"
alias git-unpushed="git log origin/master..HEAD"

export EDITOR="vim"
alias ta="tmux attach"
alias stundenzettel=' git log --committer="`git config --get user.name`" --since="$(ruby -e "require \"date\";puts Date.new((d=Date.today-30).year,d.month,20)")"  --pretty=format:"%C(white)%h %C(yellow)%ad%C(reset) %s %b" --date=short --stat  '

alias ctags-refresh='ctags --extra=+f -f .tags --languages=Ruby --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*'

function port() {
  cat /etc/nginx/nginx.rb | grep ${1}.swi | egrep -o '[0-9]+'
}
alias shortdig="dig ANY  +nocl +recurse +nocmd +nostats +noquestion +nocomments +answer"
alias tmux-clear-all='tmux list-windows -t CRM|grep -v vim|cut -d: -f1|xargs -I{} tmux send-keys -t CRM:{} C-l '

alias ssh-agent-start='eval `ssh-agent` && ssh-add -t600'
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
