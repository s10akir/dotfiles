#! /bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# applications

# zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -s $SCRIPT_DIR/src/.zlogin $HOME
ln -s $SCRIPT_DIR/src/.zlogout $HOME
ln -s $SCRIPT_DIR/src/.zpreztorc $HOME
ln -s $SCRIPT_DIR/src/.zprofile $HOME
ln -s $SCRIPT_DIR/src/.zshenv $HOME
ln -s $SCRIPT_DIR/src/.zshrc $HOME

# nvim
mkdir -p $HOME/.config/nvim
ln -s $SCRIPT_DIR/src/.config/nvim/init.vim $HOME/.config/nvim/
ln -s $SCRIPT_DIR/src/.config/nvim/dein.toml $HOME/.config/nvim/

# i3
mkdir -p $HOME/.config/i3
ln -s $SCRIPT_DIR/src/.config/i3/config $HOME/.config/i3/

# tmux
ln -s $SCRIPT_DIR/src/.tmux.conf $HOME
