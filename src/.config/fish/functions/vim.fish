# Defined in - @ line 1
function vim --wraps=nvim --description 'alias vim=nvim'
  if type "nvim" > /dev/null 2>&1
    nvim $argv;
  else
    eval (which vim) $argv;
  end
end
