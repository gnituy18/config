#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s /usr/local/bin/mvim /usr/local/bin/vim
if [ -h ~/.vim ] ; then
	rm -rf ~/.vim
fi

ln -s ${DIR}/.vim ~/.vim
ln -s ${DIR}/.vimrc ~/.vimrc
ln -s ${DIR}/.bash_profile ~/.bash_profile
ln -s ${DIR}/.tern-project ~/.tern-project
ln -s ${DIR}/.gitignore ~/.gitignore

git submodule update --init --recursive
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore

function copy {
	
}
