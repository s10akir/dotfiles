#! /bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)


# TODO: /.config に入っていない dotfiles は個別に貼ってる
#       ディレクトリを無視するループを書けばいいだけなのでそのうちやる
ln -snfv $SCRIPT_DIR/src/.gitconfig $HOME
ln -snfv $SCRIPT_DIR/src/.tmux.conf $HOME


ONLY_LINUX="^(compton|i3|polybar)$"

mkdir $HOME/.config
for f in `ls $SCRIPT_DIR/src/.config/`; do
  rm -rf $HOME/.config/$f # DANGER

  if [[ $f =~ $ONLY_LINUX ]]; then
    if [ "$(uname)" == 'Darwin' ]; then
      echo "[skip] $f is only linux config"
    else
      # Linuxのみ
      ln -snfv $SCRIPT_DIR/src/.config/$f $HOME/.config
    fi
  else
    # mac Linux共通
    ln -snfv $SCRIPT_DIR/src/.config/$f $HOME/.config
  fi
done
