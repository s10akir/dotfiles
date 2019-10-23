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
    tmux new-session && exit
  fi
  create_new_session="Create New Session"
  ID="${create_new_session}\n$ID:"
  ID="`echo $ID | fzf | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session && exit
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID" && exit
  else
    :  # Start terminal normally
  fi
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:/home/akkisino02/.gem/ruby/2.6.0/bin

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

export EDITOR=vim

setopt no_beep
KEYTIMEOUT=1

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
alias cat='bat'
alias bkl='(){xbacklight $1 10}'
alias noti='notify-send'
