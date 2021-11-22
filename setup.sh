#!/bin/bash

ln -s /Users/sfhp/config/bin /Users/sfhp/bin

ln -s /Users/sfhp/config/.bash_profile /Users/sfhp/.bash_profile
ln -s /Users/sfhp/config/.bashrc /Users/sfhp/.bashrc
ln -s /Users/sfhp/config/.profile /Users/sfhp/.profile
ln -s /Users/sfhp/config/.gitignore /Users/sfhp/.gitignore
ln -s /Users/sfhp/config/.gitconfig /Users/sfhp/.gitconfig
ln -s /Users/sfhp/config/.tmux.conf /Users/sfhp/.tmux.conf

ln -s /Users/sfhp/config/nvim /Users/sfhp/.config/nvim
ln -s /Users/sfhp/config/alacritty /Users/sfhp/.config/alacritty

touch /Users/sfhp/local.sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
