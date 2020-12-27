if [ -f ~/bin/git-prompt.sh ]; then
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWUPSTREAM='auto'
	GIT_PS1_SHOWCOLORHINTS=true
	source ~/bin/git-prompt.sh
fi

if [ -f ~/.fzf.bash ]; then
	source ~/.fzf.bash
fi

alias shutdown='shutdown -h 0'
alias tmux='tmux -u'
alias sed="gsed"

export PATH="$HOME/bin:$HOME/scripts:$HOME/.cargo/bin:$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

PS1='\[\e[0;34m\]\w\[\e[0m\]\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[0m\]\[\e[0;32m\] $\[\e[0m\] '
PS2='\[\e[0m\]\[\e[0;32m\]>\[\e[0m\] '
