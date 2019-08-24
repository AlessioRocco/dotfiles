function fzf_git_log
  git log --color $argv | \
  fzf --ansi --reverse --no-sort --preview \
    "echo {} | \
     grep -o '[a-f0-9]\{7\}' | \
     head -1 |
     xargs -I % fish -c 'git show --color --format=medium % | \
     diff-so-fancy'" \
  --bind "ctrl-e:preview-down,ctrl-y:preview-up,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,ctrl-r:toggle-preview" \
  --preview-window="right:50%" | \
  grep -Eo '([a-f0-9]{7})' | \
  tr -d '\n'
end
