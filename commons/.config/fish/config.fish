set -x LANG en_US.UTF-8

# ghq root directory
set -x GHQ_ROOT $HOME/.ghq

# 一番最後にstarshipの初期化
starship init fish | source
