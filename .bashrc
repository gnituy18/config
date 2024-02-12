if [ -f ~/bin/git-prompt.sh ]; then
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWUPSTREAM='auto'
	source ~/bin/git-prompt.sh
fi

if [ -f ~/.fzf.bash ]; then
	source ~/.fzf.bash
fi

export HISTCONTROL=-1
export HISTSIZE=-1
export HISTCONTROL=ignoredups:ignorespace
opt_hist() {
	TMP="$(mktemp)"
	tail -r ~/.bash_history  > $TMP
	awk '!x[$0]++' $TMP | tail -r > ~/.bash_history
	rm $TMP
}
export PROMPT_COMMAND='history -a && history -c && history -r && opt_hist'

export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:/opt/homebrew/bin:$PATH"
export GOPATH="$HOME/go"

PS1='\[\e[0;34m\]\w\[\e[0m\]\[\e[0;31m\]$(__git_ps1 " %s")\[\e[0m\]\[\e[0;32m\] $\[\e[0m\] '
PS2='\[\e[0m\]\[\e[0;32m\]>\[\e[0m\] '
