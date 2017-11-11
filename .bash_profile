PS1='\[\e[0;32m\]\W ➤\[\e[0m\] '

export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.cargo/bin:$PATH"
