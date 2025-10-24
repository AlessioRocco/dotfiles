function fzf_git_branch
  git branch --color $argv | \
  sed -e '/HEAD/d' | \
  fzf --ansi --reverse --no-sort | \
  sed -e 's/* //' | \
  awk '{$1=$1};1' | \
  tr -d '\n'
end
