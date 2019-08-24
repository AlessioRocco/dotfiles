function fzf_git_stash_list
  git stash list $argv | \
  fzf --ansi --reverse --no-sort --preview \
    "git stash show (echo {}| cut -d: -f1) --color=always | diff-so-fancy" \
  --bind "ctrl-e:preview-down,ctrl-y:preview-up,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,ctrl-r:toggle-preview" \
  --preview-window="right:50%" | \
  cut -d: -f1 | \
  tr -d '\n'
end
