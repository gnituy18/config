#!/bin/bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask

brew install bash
brew install macvim
brew install git
brew install cmake
brew install ruby
brew install python
brew install python3
brew install node
brew install npm

brew cask install google-chrome

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s /usr/local/bin/mvim /usr/local/bin/vim
if [ -h ~/.vim ] ; then
	rm -rf ~/.vim
fi
ln -s ${DIR}/.vim ~/.vim
ln -s ${DIR}/.vimrc ~/.vimrc
ln -s ${DIR}/.bash_profile ~/.bash_profile

git submodule update --init --recursive
git config --global core.editor vim

${DIR}/.vim/bundle/YouCompleteMe/install.py --clang-completer --tern-completer
