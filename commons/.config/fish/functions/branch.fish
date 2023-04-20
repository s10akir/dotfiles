# Defined in - @ line 1
function branch --wraps='git branch | fzf | xargs git switch' --description 'alias branch git branch -a | fzf | xargs git switch'
  if [ -z "$argv" ];
    set argv '';
  end

  git branch | fzf -q $argv | xargs git switch;
end
