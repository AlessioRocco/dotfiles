# Kill process with television

function kill_process --description "Kill process"
  set -l __kp__pid (tv --source-command "ps -ef | sed 1d" --no-preview | awk '{print $2}')

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
  end
end
