# Never Leaving Tmux

function ensure_tmux_is_running
  if status is-interactive
  and not set -q TMUX
    tat
  end
end
