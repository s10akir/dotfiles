set -x GOPATH $HOME/.go
set -x PATH $PATH:$GOPATH/bin

# oh-my-fish/theme-oceanの設定
set -g theme_display_user yes
set -g default_user DUMMY # 常にUSER@HOST出してほしいのでDUMMYにしておく
