#! /bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)


# TODO: /.config に入っていない dotfiles は個別に貼ってる
#       ディレクトリを無視するループを書けばいいだけなのでそのうちやる
ln -sfv $SCRIPT_DIR/src/.gitconfig $HOME
ln -sfv $SCRIPT_DIR/src/.tmux.conf $HOME


ONLY_LINUX="^(compton|i3|polybar)$"

for f in `ls $SCRIPT_DIR/src/.config/`; do
  if [[ $f =~ $ONLY_LINUX ]]; then
    if [ "$(uname)" == 'Darwin' ]; then
      echo "[skip] $f is only linux config"
    else
      # Linuxのみ
      ln -sfv $SCRIPT_DIR/src/.config/$f $HOME/.config/
    fi
  else
    # mac Linux共通
    ln -sfv $SCRIPT_DIR/src/.config/$f $HOME/.config/
  fi
done
