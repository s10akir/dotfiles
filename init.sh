#! /bin/sh

$script_dir=`dirname $0`

cd

# applications

# zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -s $script_dir/src/.zlogin
ln -s $script_dir/src/.zlogout
ln -s $script_dir/src/.zpreztorc
ln -s $script_dir/src/.zprofile
ln -s $script_dir/src/.zshenv
ln -s $script_dir/src/.zshrc

# nvim
mkdir -p .config/nvim
ln -s $script_dir/src/.config/nvim/init.vim .config/nvim/

# i3
mkdir -p .config/i3
ln -s $script_dir/src/.config/i3/config .config/i3/

# tmux
ln -s $script_dir/src/.tmux.conf ~/
