export PATH=/bin:$HOME/bin:/usr/local:/usr/local/mysql/bin:$PATH
export PATH=$HOME/local/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Haskell/opt/local/bin:/opt/local/sbin:/Users/rickwinfrey/.local/bin:$PATH
export PATH=$HOME/riak-1.2.1/rel/riak/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#export PATH=$HOME/racket/bin:$PATH

# Keeping for reference
# export EDITOR="$HOME/bin/mate -w"

# Keeping this in here in case I have MySQL environmental issues again.
# export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# rbenv
# eval "$(rbenv init -)"
# export PATH=/Library/Frameworks/JRuby.framework/Versions/Current/bin/:$PATH
 #ALIASES
  # clojure
    alias cljr="cd ~/Development/clojure"

  # java
    alias jrepl="java -jar ~/REPL.jar"

  # nav
    alias l="ls -alhFGg"
    alias play="cd ~/play ; l"
    alias profile="vim ~/.bash_profile"
    alias ..="cd .. ; l"
    alias ...="cd ../.. ; l"
    alias ....="cd ../../.. ; l"
    alias work="cd ~/work ; l"
    alias dotfiles="cd ~/dotfiles ; l"

  # rindlet
    alias alice="cd ~/Development/alice"
    alias cramer="cd ~/Development/stocklet"

  # rbenv
  #  alias rv="rbenv"
  #  alias ri="env CC=/usr/bin/gcc rbenv install"
  #  alias rl="rbenv local"
  #  alias rg="rbenv global"
  #  alias rs="rbenv shell"
  #  alias rvs="rbenv versions"

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
    alias rrbx="    rvm use \$(rvm list strings | grep -i rbx        | tail -1)"
    alias rmac="    rvm use \$(rvm list strings | grep -i macruby    | tail -1)"
    alias rjav="    rvm use \$(rvm list strings | grep -i jruby      | tail -1)"
    alias r186="    rvm use \$(rvm list strings | grep -i 1.8.6      | tail -1)"
    alias r187="    rvm use \$(rvm list strings | grep -i 1.8.7      | tail -1)"
    alias r191="    rvm use \$(rvm list strings | grep -i 1.9.1      | tail -1)"
    alias r192180=" rvm use \$(rvm list strings | grep -i 1.9.2-p180 | tail -1)"
    alias r192="    rvm use \$(rvm list strings | grep -i 1.9.2      | tail -1)"
    alias r193="    rvm use \$(rvm list strings | grep -i 1.9.3      | tail -1)"
    alias r2="      rvm use \$(rvm list strings | grep -i 2.0        | tail -1)"

  # WSU Server aliases
    alias kira="ssh rewinfre@kira.cs.wichita.edu"
    alias scotty="ssh rewinfre@scotty.cs.wichita.edu"
    alias spock="ssh rewinfre@spock.cs.wichita.edu"
    alias kirk="ssh rewinfre@kirk.cs.wichita.edu"

  # homebrew
    alias brew-formulas="open 'https://github.com/mxcl/homebrew/tree/master/Library/Formula'"

  # Ruby
    alias cuc="cucumber"
    alias rspec="rspec spec"

  # Rails
    alias sc="script/console"
    alias ss="script/server"

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

  # Give it a # and a dir, it will cd to that dir, then `cd ..` however many times you've indicated with the number
  # The number defaults to 1, the dir, if not provided, defaults to the output of the previous command
  # This lets you find the dir on one line, then run the command on the next
    2dir() {
      last_command="$(history | tail -2 | head -1 | sed 's/^ *[0-9]* *//')"
      count="${1-1}"
      name="${2:-$($last_command)}"
      while [[ $count > 0 ]]
        do
          name="$(dirname "$name")"
          ((count--))
      done
      echo "$name"
      cd "$name"
    }

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

  # when you forget to bundle exec, just run `be` it will rerun the command with bundler
  # when you want to run a command with bundler, just prepend this function, ie `be rake spec`
    function be {
      if [ $# -eq 0 ]; then
        local command=bundle\ exec\ "$(history | grep -v '^ *[0-9]* *be$' | tail -1 | sed 's/^[ \t]*[0-9]*[ \t]*//')"
        echo expand to: "$command"
        eval "$command"
      else
        bundle exec "$@"
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
  #PS1="\[\033[90;47m\] \@ \[\033[0m\] \[\033[93;46m\] \w \[\033[0m\] \[\033[91;43m\] \[\033[0m\] \[\033[97;44m\]\$(parse_git_branch)\[\033[0m\]\n\$ \[\033[0m\]"

  # gray-scalar prompt
  PS1="\[\033[90;47m\] \w \[\033[0m\] \[\033[90;47m\]\[\033[0m\]\n\$ \[\033[0m\]"


# Setting PATH for JRuby 1.7.2
# The orginal version is saved in .bash_profile.jrubysave
PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH
source /Users/bashrw/.rvm/scripts/rvm
