[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ -f ~/.profile ]] && source ~/.profile
[[ -f ~/local.sh ]] && source ~/local.sh

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/charliehsu/gcloud/google-cloud-sdk/path.bash.inc' ]; then . '/Users/charliehsu/gcloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/charliehsu/gcloud/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/charliehsu/gcloud/google-cloud-sdk/completion.bash.inc'; fi
