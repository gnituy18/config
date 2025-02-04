## MacOS Setup

1. 設定Dock, 變更鍵, 熱點, iCloud同步
1. [更新Github SSH key pair](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
1. `brew install eloston-chromium ghostty font-fira-code bash tmux neovim git fzf ripgrep wget fd lua go python luarocks nvm`
1. `nvim /etc/shells` 貼上 `/opt/homebrew/bin/bash`
1. `chsh` 貼上 `/opt/homebrew/bin/bash`
1. `mkdir .nvm`
1. `nvm install --lts`
1. `git clone git@github.com:gnituy18/config.git`
1. `mkdir /Users/hsuyuting/.config`
1. `ln -s /Users/hsuyuting/config/bin /Users/hsuyuting/bin`
1. `ln -s /Users/hsuyuting/config/ghostty /Users/hsuyuting/.config/ghostty`
1. `ln -s /Users/hsuyuting/config/nvim /Users/hsuyuting/.config/nvim`
1. `ln -s /Users/hsuyuting/config/.bash_profile /Users/hsuyuting/.bash_profile`
1. `ln -s /Users/hsuyuting/config/.gitconfig /Users/hsuyuting/.gitconfig`
1. `ln -s /Users/hsuyuting/config/.gitignore /Users/hsuyuting/.gitignore`
1. `ln -s /Users/hsuyuting/config/.tmux.conf /Users/hsuyuting/.tmux.conf`
1. `touch ~/local.sh`
