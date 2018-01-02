#! /usr/bin/env ruby

# Setup symlinks
`
ln -s dotfiles/bash_files/.bash_profile .bash_profile;
ln -s dotfiles/vim_files                .vim;
ln -s dotfiles/vim_files/.vimrc         .vimrc;
ln -s dotfiles/tmux_files/.tmux.conf    .tmux.conf;
ln -s dotfiles/git_files/.gitconfig     .gitconfig;
ln -s dotfiles/git_files/.gitignore     .gitignore
`

# Brewfile
`brew bundle`

# System configuration

# Initial key repeat (default is 15 (225 ms))
`defaults write -g InitialKeyRepeat -int 15`

# Faster key repeat (default is 2 (30 ms))
`defaults write -g KeyRepeat -int 1`

# Disable Accent Menu when you hold down a key
`defaults write -g ApplePressAndHoldEnabled -bool false`

# Hide desktop icons
`defaults write com.apple.finder CreateDesktop false; killall Finder`
