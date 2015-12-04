#! /usr/bin/env ruby

# Setup symlinks
`
ln -s dotfiles/emacs_files/             .emacs.d;
ln -s dotfiles/bash_files/.bash_profile .bash_profile;
ln -s dotfiles/zsh_files/.zshrc         .zshrc;
ln -s dotfiles/vim_files                .vim;
ln -s dotfiles/vim_files/.vimrc         .vimrc;
ln -s dotfiles/tmux_files/.tmux.conf    .tmux.conf;
ln -s dotfiles/tmux_files/.teamocil     .teamocil;
ln -s dotfiles/git_files/.gitconfig     .gitconfig;
ln -s dotfiles/git_files/.gitignore     .gitignore
`

# Bootstrap basic environment
`
git clone https://github.com/mikemcquaid/strap
cd strap
bin/strap.sh --debug
`
