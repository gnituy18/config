## MacOS Setup

1. 設定Dock
1. 設定熱點: 右上->通知中心
1. AppleID -> iCloud: 同步文件跟桌面
1. 下載[brew](https://brew.sh/)
1. `brew install alacritty bash tmux neovim git fzf ripgrep wget fd python`
1. `/opt/homebrew/opt/fzf/install`
1. 下載[nvm](https://github.com/nvm-sh/nvm)
1. 下載[Go](https://go.dev/dl/)
1. 下載[Rust](https://www.rust-lang.org/zh-TW/learn/get-started)
1. [更新Github SSH key pair](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
1. `nvim /etc/shells` 貼上 `/opt/homebrew/bin/bash`
1. `chsh` 貼上 `/opt/homebrew/bin/bash`
1. `git clone git@github.com:gnituy18/config.git`
1. `mkdir /Users/hsuyuting/.config`
1. `ln -s /Users/hsuyuting/config/nvim /Users/hsuyuting/.config/nvim`
1. `ln -s /Users/hsuyuting/config/alacritty /Users/hsuyuting/.config/alacritty`
1. `ln -s /Users/hsuyuting/config/bin /Users/hsuyuting/bin`
1. `ln -s /Users/hsuyuting/config/.bash_profile /Users/hsuyuting/.bash_profile`
1. `ln -s /Users/hsuyuting/config/.bashrc /Users/hsuyuting/.bashrc`
1. `ln -s /Users/hsuyuting/config/.gitignore /Users/hsuyuting/.gitignore`
1. `ln -s /Users/hsuyuting/config/.gitconfig /Users/hsuyuting/.gitconfig`
1. `ln -s /Users/hsuyuting/config/.tmux.conf /Users/hsuyuting/.tmux.conf`
1. `touch ~/local.sh`
