function fzf_bundle_open
  bundle open --name-only | \
  fzf-tmux --ansi --reverse --no-sort | bundle list --name-only
end
