#!/bin/bash

CMD=$1
NAME=$2

case $CMD in
	add) 
		touch ~/drive/notes/$NAME.md 
		;;
	rm) 
		name=$(ls ~/drive/notes | fzf)
		if [ $name ] ; then 
			rm ~/drive/notes/$name
		fi
		;;
	*)
		if [ -e ~/drive/notes/$NAME.md ] ; then
			nvim ~/drive/notes/$NAME.md
		else
			name=$(ls ~/drive/notes | fzf)
			if [ $name ] ; then 
				nvim ~/drive/notes/$name
			fi
		fi
		;;
esac
