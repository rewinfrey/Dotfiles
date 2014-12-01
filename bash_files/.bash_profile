export PATH=/bin:$HOME/bin:/usr/local:/usr/local/mysql/bin:$PATH
export PATH=$HOME/local/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Haskell/opt/local/bin:/opt/local/sbin:/Users/rickwinfrey/.local/bin:$PATH
export PATH=$HOME/riak-1.2.1/rel/riak/bin:$PATH
#source /usr/local/opt/chruby/share/chruby/chruby.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#ALIASES
  # vim
    alias vim="/usr/local/Cellar/vim/7.4.273/bin/vim"

  # clojure
    alias cljr="cd ~/code/clojure"

  # tmux
    alias tmux="TERM=screen-256color-bce tmux"

  # java
    alias jrepl="java -jar ~/REPL.jar"

  # nav
    alias l="ls -alhFGg"
    alias profile="vim ~/.bash_profile"
    alias ..="cd .. ; l"
    alias ...="cd ../.. ; l"
    alias ....="cd ../../.. ; l"
    alias code="cd ~/code ; l"
    alias hire="cd ~/code/hireology; l"
    alias app="cd ~/code/hireology/app; l"
    alias dotfiles="cd ~/dotfiles ; l"
    alias rick="cd ~/code/rick ; l"
    alias htdocs="cd /Applications/MAMP/htdocs ; l"

  # rbenv
    alias local="rbenv local"
    alias global="rbenv global"
    alias rubies="rbenv versions"

  # git
    alias gs="  git status"
    alias gd="  git diff --pretty=format:\"%Cgreen%h%Creset %Cblue%ad%Creset %s%C(yellow)%d%Creset %Cblue[%an]%Creset\" --graph --date=short --branches"
    alias go="  colour-stderr-red git checkout"
    alias gb="  git branch -a"
    alias ga="  git add ."
    alias gcm=" git commit -m"
    alias gp="  git push"
    alias gh="  git hist"
    alias gl="  git log --pretty=format:\"%Cgreen%h%Creset %Cblue%ad%Creset %s%C(yellow)%d%Creset %Cblue[%an]%Creset\" --graph --date=short --branches"

  # rvm
    #alias rrbx="    rvm use \$(rvm list strings | grep -i rbx        | tail -1)"
    #alias rmac="    rvm use \$(rvm list strings | grep -i macruby    | tail -1)"
    #alias rjav="    rvm use \$(rvm list strings | grep -i jruby      | tail -1)"
    #alias r186="    rvm use \$(rvm list strings | grep -i 1.8.6      | tail -1)"
    #alias r187="    rvm use \$(rvm list strings | grep -i 1.8.7      | tail -1)"
    #alias r191="    rvm use \$(rvm list strings | grep -i 1.9.1      | tail -1)"
    #alias r192180=" rvm use \$(rvm list strings | grep -i 1.9.2-p180 | tail -1)"
    #alias r192="    rvm use \$(rvm list strings | grep -i 1.9.2      | tail -1)"
    #alias r193="    rvm use \$(rvm list strings | grep -i 1.9.3      | tail -1)"
    #alias r2="      rvm use \$(rvm list strings | grep -i 2.0        | tail -1)"

  # Hireology
    alias fetch_db="code; cd shell; ./pull_db_from_qa.sh; ./restore_db.sh"

  # WSU Server aliases
    #alias kira="ssh rewinfre@kira.cs.wichita.edu"
    #alias scotty="ssh rewinfre@scotty.cs.wichita.edu"
    #alias spock="ssh rewinfre@spock.cs.wichita.edu"
    #alias kirk="ssh rewinfre@kirk.cs.wichita.edu"

  # homebrew
    alias brew-formulas="open 'https://github.com/mxcl/homebrew/tree/master/Library/Formula'"

  # Ruby
    alias be="bundle exec"
    alias cuke="cucumber"
    alias rspec="rspec spec"

  # Rails
    alias rs="rails server"
    alias rc="rails console"
    alias test="export RAILS_ENV=test"
    alias dev="export RAILS_ENV=development"
    alias prod="export RAILS_ENV=production"

  # Tmate
    alias tmate="TERM=xterm-256color tmate"

  # generic
    alias c="clear"
    #alias ss="python -m SimpleHTTPServer" # simple server (serves current dir on port 8000)

  # instaweb
    alias instaweb="git instaweb -d webrick"
    alias instaweb_start="git instaweb -d webrick --start"
    alias instaweb_stop="git instaweb -d webrick --stop"

  # editors
    alias vim="vim -cNERDTree"
    alias m="open -a TextMate.app *"

  # heroku
    alias hp="heroku run console pry"
    alias hl="heroku logs"
    alias ph="git add .; git commit -m 'apples and arrows'; git push heroku master"

  # postgresql
    alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
    alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

  # shell
    alias s="source ~/.bash_profile"

  # ctags
    alias ctags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

  # utilities
    alias au="ruby ~/code/ruby/utilities/lib/ack_unique.rb"

  # take you to the dir of a file in a gem. e.g. `2gem rspec`
    2gem () {
      cd "$(dirname $(gem which $1))"
    }

  # PROGRAMS (functions, binaries, aliases that behave like programs)
  # convert colons to newlines, ie `:2n $PATH` or `:2n < /etc/passwd`
    function :2n {
      if [ "$#" -eq 0 ]; then
        tr : "\n"
      else
        tr : "\n" <<< "$*"
      fi
    }

  # This is absolutely disgusting, but I can't find a better way to do it. It will colourize the
  # standarderr red (but will print on stdout, and stdout on stderr)
    function colour-red {
      ruby -e '$stderr.print "\e[31m", $stdin.read, "\e[0m"'
    }
    function colour-stderr-red {
      ( $* 3>&1 1>&2- 2>&3- ) | colour-red
    }

  # At some point it might become necessary to rewrite this in C, but for now this will do
    alias chomp="ruby -e 'print \$stdin.read.chomp'"

# PROMPT
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
  }

  # multi-colored prompt
  #PS1="\[\033[90;47m\] \@ \[\033[0m\] \[\033[90;47m\] \w \[\033[0m\] \[\033[90;47m\] $(~/.rvm/bin/rvm-prompt) \[\033[0m\] \[\033[90;47m\]\$(parse_git_branch)\[\033[0m\]\n\$ \[\033[0m\]"

  # gray-scalar prompt
  PS1="\[\033[7;38;47m\] \w \[\033[0m\] \[\033[8;37;40m\]\$(parse_git_branch)\[\033[0m\]\n🐰  "


# Setting PATH for JRuby 1.7.2
# The orginal version is saved in .bash_profile.jrubysave
PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH
#source /Users/bashrw/.rvm/scripts/rvm

# Brew completion
if [ -f ~/.brew_completion.sh ]; then
    . ~/.brew_completion.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
