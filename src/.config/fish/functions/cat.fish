function cat --description 'exist bat ? bat : cat'
  if type "bat" > /dev/null 2>&1
    bat $argv;
  else
    eval (which cat) $argv;
  end
end
