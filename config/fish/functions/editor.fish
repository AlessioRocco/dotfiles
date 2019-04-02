# Open nvim with given arguments and sets tmux window name to "nvim" if inside
# a tmux session.

function editor --wraps=nvim
  if set -q TMUX
    tmux rename-window "nvim"
  end

  nvim $argv
end
