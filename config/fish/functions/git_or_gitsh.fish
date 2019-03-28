# No arguments: `gitsh`
# With arguments: acts like `git`

function git_or_gitsh --wraps=git
  if count $argv > /dev/null
    git $argv
  else
    if set -q TMUX
      tmux rename-window "gitsh"
    end

    gitsh
  end
end
