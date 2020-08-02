function ls --description 'ls'
  if [ (uname) = "Darwin" ]
    if type "gls" > /dev/null 2>&1
      gls --color --group-directories-first $argv;
    else
      ls argv;
    end
  else if [ (uname) = "Linux" ]
    ls --color --group-firectories-first $argv;
  end
end
