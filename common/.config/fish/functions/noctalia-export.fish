# Export the active Noctalia config into config.toml without truncating
# the file Noctalia watches: write a temp file, validate it, then move it
# onto the symlink target so the symlink itself survives.

function noctalia-export
  set -l target (realpath ~/.config/noctalia/config.toml)
  or return

  set -l tmp (mktemp (dirname $target)/.config.XXXXXX)
  or return

  if not noctalia config export >$tmp
    rm -f $tmp
    return 1
  end

  if not noctalia config validate $tmp
    rm -f $tmp
    return 1
  end

  chmod 644 $tmp
  mv $tmp $target
end
