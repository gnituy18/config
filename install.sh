#!/bin/bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask

brew install bash
brew isntall macvim
brew install git
brew install cmake

brew install ruby
brew install python
brew install python3
brew cask install google-chrome

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s /usr/local/bin/mvim /usr/local/bin/vim
ln -s ${DIR}/.vim ~/.vim
ln -s ${DIR}/.vimrc ~/.vimrc
ln -s ${DIR}/.bash_profile ~/.bash_profile

git config --global core.editor vim
