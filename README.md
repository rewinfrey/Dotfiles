# Dotfiles

This is a way over-complicated way to maintain dotfiles, but I wanted to learn about git submodules, Ai!

### What to do?

#### Preparing the submodules:

This used to be a lot more complicated, but rather than initializing the submodules and updating them recursively, use `clone --recursive` like so:
````
$ git clone --recursive git@github.com:rewinfrey/dotfiles.git
````

This will initialize and update all submodules. You'll see that the vim_files submodule contains a series of submodules in the /bundle directory. The clone --recursive strategy also correctly initializes and updates these submodules, too.

#### Symlink up!

````
$ cd
$ ln -s dotfiles/bash_files/.bash_profile .bash_profile
$ ln -s dotfiles/zsh_files/.zshrc         .zshrc
$ ln -s dotfiles/vim_files                .vim
$ ln -s dotfiles/vim_files/.vimrc         .vimrc
$ ln -s dotfiles/tmux_files/.tmux.conf    .tmux.conf
$ ln -s dotfiles/git_files/.gitconfig     .gitconfig # make sure you update the git username and email to yours!
````
