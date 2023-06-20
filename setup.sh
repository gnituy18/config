#!/bin/bash

ln -s /Users/hsuyuting/config/bin /Users/hsuyuting/bin
ln -s /Users/hsuyuting/config/.bash_profile /Users/hsuyuting/.bash_profile
ln -s /Users/hsuyuting/config/.bashrc /Users/hsuyuting/.bashrc
ln -s /Users/hsuyuting/config/.profile /Users/hsuyuting/.profile
ln -s /Users/hsuyuting/config/.gitignore /Users/hsuyuting/.gitignore
ln -s /Users/hsuyuting/config/.gitconfig /Users/hsuyuting/.gitconfig
ln -s /Users/hsuyuting/config/.tmux.conf /Users/hsuyuting/.tmux.conf

mkdir /Users/hsuyuting/.config
ln -s /Users/hsuyuting/config/nvim /Users/hsuyuting/.config/nvim
ln -s /Users/hsuyuting/config/alacritty /Users/hsuyuting/.config/alacritty

touch /Users/hsuyuting/local.sh

echo "/opt/homebrew/bin/bash" >> /etc/shells
chsh -s /opt/homebrew/bin/bash
