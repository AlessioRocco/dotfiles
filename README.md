# Dotfiles

Dotfiles and shell scripts to set up my macOS and Linux machines for
development. Symlinks are managed with [GNU Stow][stow].

[stow]: https://www.gnu.org/software/stow/

## Layout

- `common/` — dotfiles shared between macOS and Linux (Stow package).
- `macos/` — macOS-only dotfiles and setup (Stow package).
- `linux/` — Linux-only dotfiles and setup (Stow package).
- `bin/` — the setup orchestrator and shared install steps (not symlinked).
- Repo files (`README.md`, `AGENTS.md`, `LICENSE`, ...) live at the root and
  are not symlinked.

Each package mirrors `$HOME`. For example `common/.config/fish/config.fish`
is linked to `~/.config/fish/config.fish`.

## Install

On macOS, install the Command Line Tools first:

```sh
xcode-select --install
```

Clone the repo and run setup:

```sh
git clone https://github.com/AlessioRocco/dotfiles ~/dotfiles
~/dotfiles/bin/setup
```

`bin/setup` installs Stow, links the `common` package, then links and runs the
setup for the current OS (`macos` or `linux`).

## Managing symlinks

Run Stow from the repo root (`.stowrc` sets the target to `$HOME` and
`--no-folding`):

```sh
stow common          # link shared dotfiles
stow macos           # link macOS-only dotfiles (or: stow linux)
stow -R common       # re-link after adding/removing files
stow -D common       # unlink
stow -n -v common    # dry-run (preview without changing anything)
```

`--no-folding` keeps real directories with per-file symlinks, so tools that
write into their config dirs (fisher, mise, LazyVim) don't write into the repo.

## Notes

- OS-specific differences are handled with stowed fragments:
  - `~/.gitconfig.os` (included by `~/.gitconfig`) carries the SSH signing
    program per platform.
  - `~/.config/fish/conf.d/os.fish` carries Homebrew paths per platform.

## License

Dotfiles is (c) 2019-2026 Alessio Rocco
It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: LICENSE
