export PATH="/Users/rewinfrey/.stack/programs/x86_64-osx/ghc-8.0.1/bin/":$PATH
export PATH=/usr/local/bin:/bin:$HOME/bin:/usr/local:/usr/local/mysql/bin:$PATH
export PATH=$HOME/local/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Haskell/opt/local/bin:/opt/local/sbin:/Users/rickwinfrey/.local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH=bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=node_modules/.bin:$PATH
export PATH=/Users/rewinfrey/.local/bin/stack:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Brew completion
if [ -f ~/.brew_completion.sh ]; then
  . ~/.brew_completion.sh
fi

# Git completion
source $HOME/.dotfiles/git_files/git-completion.bash

# BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-default.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#ALIASES
  # vim
    alias vim="/usr/local/Cellar/vim/7.4.273/bin/vim"

  # clojure
    alias cljr="cd ~/code/clojure"
    alias dev="ENV=development lein with-profile development"
    alias spec="ENV=spec lein with-profile spec"

  # haskell
    alias rh="runhaskell -isrc -itest"
    alias ht="stack test"
    alias hmake="ghc --make -isrc -Wall -o"
    alias build-all="stack build; stack build :semantic-diff-test; stack build semantic-difftool; stack build semantic-git-diff"
    alias hd='ghcid "--command=stack ghci semantic-diff"'

  # tree-sitter
    alias tsgr="tree-sitter generate && node-gyp build --release"
    alias tsgd="tree-sitter generate && node-gyp build --debug"
    alias tst="npm test"
    alias ts="cd ~/tree-sitter; l"
    alias tsp=tsparse

    function tsparse {
      tree-sitter parse $1 -p
    }

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
    alias code="cd ~/Documents/code ; l"
    alias learning="cd ~/Documents/learning ; l"
    alias dotfiles="cd ~/dotfiles ; l"
    alias rick="cd ~/Documents/code/rick ; l"
    alias blog="cd ~/Documents/code/blog ; l"
    alias htdocs="cd /Applications/MAMP/htdocs ; l"
    alias fletching="cd ~/Documents/code/ruby/fletching; l"
    alias action_logic="cd ~/Documents/code/ruby/ActionLogic; l"
    alias al="cd ~/Documents/code/ruby/ActionLogic; l"
    alias grad="cd ~/grad; l"
    alias github="cd ~/github; l"
    alias dotcom="cd ~/github/github"
    alias meditation="cd ~/Documents/code/meditation; vim ~/code/meditation/log.txt"
    alias om="cd ~/Documents/code/rails/open-mentor; l"
    alias sd="cd ~/github/semantic-diff; l"

  # rbenv
    alias local="rbenv local"
    alias global="rbenv global"
    alias rubies="rbenv versions"

  # git
    alias gs="  git status -s"
    alias gd="  git diff --graph --date=short --branches"
    alias gds=" git diff --staged"
    alias go="  colour-stderr-red git checkout"
    alias gb="  git branch -a"
    alias ga="  git add ."
    alias gc="  git commit -m"
    alias gp="  git push"
    alias gh="  git hist"
    alias gl="  git log --pretty=format:\"%Cgreen%h%Creset %Cblue%ad%Creset %s%C(yellow)%d%Creset %Cblue[%an]%Creset\" --graph --date=short --branches"
    alias gcm="  git checkout master"
    alias gpoh=" git push origin head"
    alias gpom=" git push origin master"
    alias gsu=" git submodule update --init --recursive"


  # Hireology
    alias fetch_db="code; cd shell; ./pull_db_from_qa.sh; ./restore_db.sh"

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
    alias done="say done"
    #alias ss="python -m SimpleHTTPServer" # simple server (serves current dir on port 8000)

  # instaweb
    alias instaweb="git instaweb -d webrick"
    alias instaweb_start="git instaweb -d webrick --start"
    alias instaweb_stop="git instaweb -d webrick --stop"

  # editors
    alias vim="vim -cNERDTree"
    alias m="open -a TextMate.app *"

  # ci server
    alias ci="ssh -L 8080:localhost:8080 build0"
    alias jenkins=ci

  # data warehouse qa
    alias dw_qa="ssh -L 8080:localhost:8080 da2"

  # data warehouse production
    alias dw_prod="ssh -L 8080:localhost:8080 db2"

  # heroku
    alias hp="heroku run console pry"
    alias hl="heroku logs"
    alias ph="git add .; git commit -m 'apples and arrows'; git push heroku master"

  # postgresql
    #alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
    #alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
    alias pg_start="postgres -D /usr/local/var/postgres"

  # shell
    alias s="source ~/.bash_profile"

  # ctags
    alias ctags_haskell="ctags -R --languages=haskell --exclude=.git --exclude=log --exclude=.stack-work --exclude=docs --exclude=weekly . "
    alias ctags_clojure="ctags -R --languages=clojure --exclude=.git --exclude=log . "
    #alias ctags_ruby="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"
    #function ctags_ruby {
    #  ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
    #}

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

  function git_prompt {
   current_git_branch=$(parse_git_branch)
   if [$current_git_branch -eq ""]; then
     echo  $(parse_git_branch)
   fi
  }

  # gray-scalar prompt
  PS1="\[\033[9;36;40m\] \w \[\033[0m\] \[\033[9;36;40m\]\$(parse_git_branch)\[\033[0m\]\n🐰  "

export GPG_TTY=$(tty)

