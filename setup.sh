#!/bin/bash

# terminfo
sudo tic -xe alacritty,alacritty-direct /Users/hsuyuting/Downloads/alacritty.info

# brew
brew install bash neovim tmux git fzf ripgrep fd
/opt/homebrew/opt/fzf/install

# shell
sudo echo "/opt/homebrew/bin/bash" >> /etc/shells
sudo chsh -s /opt/homebrew/bin/bash

# config
ln -s /Users/hsuyuting/config/bin /Users/hsuyuting/bin
ln -s /Users/hsuyuting/config/.bash_profile /Users/hsuyuting/.bash_profile
ln -s /Users/hsuyuting/config/.bashrc /Users/hsuyuting/.bashrc
ln -s /Users/hsuyuting/config/.profile /Users/hsuyuting/.profile
ln -s /Users/hsuyuting/config/.gitignore /Users/hsuyuting/.gitignore
ln -s /Users/hsuyuting/config/.gitconfig /Users/hsuyuting/.gitconfig
ln -s /Users/hsuyuting/config/.tmux.conf /Users/hsuyuting/.tmux.conf
ln -s /Users/hsuyuting/Google\ Drive/我的雲端硬碟/a.yaml /Users/hsuyuting/a.yaml
ln -s /Users/hsuyuting/Google\ Drive/我的雲端硬碟/notes/ /Users/hsuyuting/notes
mkdir /Users/hsuyuting/.config
ln -s /Users/hsuyuting/config/nvim /Users/hsuyuting/.config/nvim
ln -s /Users/hsuyuting/config/alacritty /Users/hsuyuting/.config/alacritty
touch /Users/hsuyuting/local.sh
