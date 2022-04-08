# Defined in - @ line 1
function branch --wraps='git branch -a | fzf | xargs git switch' --description 'alias branch git branch -a | fzf | xargs git switch'
  git branch -a | fzf | xargs git switch $argv;
end
