# Use fzf to filter pull requests

function fzf_pull_requests
  gh pr list $argv | \
  fzf --ansi --header-lines=3 --reverse --preview \
    'gh pr view {1}' \
  --bind "ctrl-e:preview-down,ctrl-y:preview-up,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,ctrl-r:toggle-preview,ctrl-o:execute-silent(gh pr view --web {1})" \
  --preview-window="bottom:50%" | \
  awk '{print $1}' | \
  xargs gh pr checkout
end
