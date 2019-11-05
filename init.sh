#! /bin/sh

cd

# applications

# zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -s .dotfiles/src/.zlogin
ln -s .dotfiles/src/.zlogout
ln -s .dotfiles/src/.zpreztorc
ln -s .dotfiles/src/.zprofile
ln -s .dotfiles/src/.zshenv
ln -s .dotfiles/src/.zshrc

# nvim
mkdir -p .config/nvim
ln -s .dotfiles/src/.config/nvim/init.vim .config/nvim/

# i3
mkdir -p .config/i3
ln -s .dotfiles/src/.config/i3/config .config/i3/
