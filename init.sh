#! /bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# applications

# zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf $SCRIPT_DIR/src/.zlogin $HOME
ln -sf $SCRIPT_DIR/src/.zlogout $HOME
ln -sf $SCRIPT_DIR/src/.zpreztorc $HOME
ln -sf $SCRIPT_DIR/src/.zprofile $HOME
ln -sf $SCRIPT_DIR/src/.zshenv $HOME
ln -sf $SCRIPT_DIR/src/.zshrc $HOME

# nvim
mkdir -p $HOME/.config/nvim
ln -sf $SCRIPT_DIR/src/.config/nvim/init.vim $HOME/.config/nvim/
ln -sf $SCRIPT_DIR/src/.config/nvim/dein.toml $HOME/.config/nvim/

# i3
mkdir -p $HOME/.config/i3
ln -sf $SCRIPT_DIR/src/.config/i3/config $HOME/.config/i3/

# polybar
mkdir -p $HOME/.config/polybar
ln -sf $SCRIPT_DIR/src/.config/polybar/config $HOME/.config/polybar/
ln -sf $SCRIPT_DIR/src/.config/polybar/launch.sh $HOME/.config/polybar/

# compton
mkdir -p $HOME/.config/compton
ln -sf $SCRIPT_DIR/src/.config/compton/compton.conf $HOME/.config/compton/

# tmux
ln -sf $SCRIPT_DIR/src/.tmux.conf $HOME
