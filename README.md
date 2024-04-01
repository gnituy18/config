## MacOS Setup

1. 設定熱點: 右上->通知中心
1. Dock移到右邊
1. iCloud同步文件跟桌面
1. 下載brew
1. `brew install alacritty bash neovim tmux git fzf ripgrep fd`
1. `/opt/homebrew/opt/fzf/install`
1. `sudo echo "/opt/homebrew/bin/bash" >> /etc/shells`
1. 設定default shell
1. 更新Github SSH key pair
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
