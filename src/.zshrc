#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# automatic start tmux
if [[ ! -n $TMUX ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    #tmux new-session && exit
    ID="(NO SESSIONS)"
  fi
  create_new_session="Create New Session"
  ID="${create_new_session}\n$ID"
  ID="`echo $ID | fzf | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session && exit
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID" && exit
  else
    # Start terminal normally
  fi
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

export BIN=~/.local/bin
export PATH=$BIN:$PATH # .local/binで横取りしたいアプリのためにわざと前に定義

export EDITOR=vim

setopt no_beep
KEYTIMEOUT=1

fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

alias clip='xclip -selection clipboard -i'
alias open='(){exec nautilus $1 > /dev/null 2>&1 &}'
alias rubo='rubocop'
alias lla='ls -la'
alias vim='nvim'
alias vi='nvim'
alias status='git status'
alias pull='git pull'
alias push='git push'
alias add='git add'
alias commit='git commit'
alias branch='git branch'
alias cat='bat'
alias bkl='(){xbacklight $1 10}'
alias noti='notify-send'
alias his='history -n -r 1 | fzf'
alias vim='docker run --rm -it -v "$(pwd)":/workdir -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY s10akir/moja-nvim:latest'


repo() {
  local dir
  dir=$(ghq list > /dev/null | fzf --reverse +m) &&
    cd $(ghq root)/$dir
}

proxy() {
  export http_proxy=http://proxy.kmt.neec.ac.jp:8080
  export HTTP_PROXY=http://proxy.kmt.neec.ac.jp:8080
  export https_proxy=http://proxy.kmt.neec.ac.jp:8080
  export HTTPS_PROXY=http://proxy.kmt.neec.ac.jp:8080
}


eval "$(hub alias -s)"

tatikaze() {
  git config --local user.name "tatikaze"
  git config --local user.email "k017c1356@it-neec.jp"
}

mojamoja() {
  git config --local user.name "Akira Shinohara"
  git config --local user.email "k017c1067@it-neec.jp"
}
