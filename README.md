## MacOS Setup

1. 指揮中心
    - 指揮中心: 滑鼠按鈕5
    - 應用程式視窗: 滑鼠按鈕4
    - 熱點
        - 右上: 通知中心
        - 右下: 啟動台
1. 鍵盤 > 變更鍵
    - Caps Lock: Control
    - Control: Command
    - Command: Caps Lock
1. Dock
1. 下載
    - Chrome
    - Google Drive
    - Alacritty
    - Amethist
    - brew
    - neovim
    - Roboto Mono
    - nerd font
1. brew install
    - bash
        - sudo echo "/usr/local/bin/bash" >> /etc/shells
        - sudo chsh -s /usr/local/bin/bash
    - tmux
    - git
    - fzf
    - httpie
    - ripgrep
    - fd
1. ssh-keygen
    - touch ~/.ssh/config
1. git
    - git clone git@github.com:gnituy18/config.git
    - cd config && ./setup.sh
