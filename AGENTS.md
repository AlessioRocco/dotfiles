# AGENTS.md

Dotfiles repository for macOS and Linux development environment configuration.
Uses [GNU Stow](https://www.gnu.org/software/stow/) for symlink management and
shell scripts for idempotent setup.

## Setup commands

- Bootstrap environment: `./bin/setup` (installs Stow, stows `common` + the
  current OS package, runs the OS setup script)
- Link shared dotfiles: `stow common`
- Link OS dotfiles: `stow macos` (or `stow linux`)
- Update symlinks after changes: `stow -R common`
- Unlink: `stow -D common`
- Preview without changes: `stow -n -v common`
- Test setup idempotency: `./bin/setup` (should run without errors)

Run `stow` from the repo root; `.stowrc` sets `--target=$HOME` and
`--no-folding`.

## Project structure

- `common/`: Dotfiles shared between macOS and Linux (Stow package).
- `macos/`: macOS-only dotfiles + `macos/bin/setup` (Stow package).
- `linux/`: Linux-only dotfiles + `linux/bin/setup` (Stow package).
- `bin/setup`: OS-agnostic orchestrator (not symlinked).
- `bin/post-install`: Shared fisher/tpm/theme install steps (not symlinked).
- Repo files (`README.md`, `AGENTS.md`, `LICENSE`, `.gitignore`, `.agents/`,
  `agents.toml`): live at the root and are not symlinked.

Each package mirrors `$HOME`. Example: `common/.config/fish/config.fish` links
to `~/.config/fish/config.fish`. `--no-folding` keeps real directories with
per-file symlinks so tools (fisher, mise, LazyVim) don't write into the repo.

## OS-specific differences

Handled with stowed fragments rather than conditionals in shared files:

- `~/.gitconfig.os` (included by `common/.gitconfig`): SSH signing program,
  provided by `macos/.gitconfig.os` and `linux/.gitconfig.os`.
- `~/.config/fish/conf.d/os.fish`: Homebrew paths, provided by
  `macos/.config/fish/conf.d/os.fish` and `linux/.config/fish/conf.d/os.fish`.

## Tech stack

- **GNU Stow**: Dotfile symlink management (config in `.stowrc`)
- **Homebrew**: Package management (bundle in `macos/bin/setup`; Linux uses apt
  + Homebrew in `linux/bin/setup`)
- **fish**: Default shell with custom configurations
- **mise**: Runtime and environment variable management

## Code style

- Follow rules in `common/.editorconfig` (2-space indent, UTF-8, LF endings)
- Shell scripts: Match existing patterns in `bin/` directory
- Max line length: 80 characters (72 for markdown/shell)

## File management

- **New shared config**: Place under `common/` mirroring its `$HOME` path
  (e.g. `common/.config/<app>/...`).
- **New OS-only config**: Place under `macos/` or `linux/` mirroring `$HOME`.
- **Exclude from symlinking**: Keep the file at the repo root (outside any
  package), or add a `.stow-local-ignore` entry.
- **New dependencies**: Add to the brew bundle in `macos/bin/setup` (and the
  apt/brew lists in `linux/bin/setup`).
- **Re-link after adding files**: `stow -R common` (and `-R macos`/`linux`).

## Testing approach

No automated tests. Manual verification required:

1. Run `./bin/setup` for dependency installation
2. Run `stow -R common` (and the OS package) to update symlinks
3. Reload shell: `exec fish` or restart terminal
4. Restart affected applications (WezTerm, Neovim, etc.)
5. Verify configuration changes take effect

## Common tasks

- **Add Homebrew package**: Edit the brew bundle in `macos/bin/setup` (and
  `linux/bin/setup`).
- **New shell alias/function**: Add to the fish config under
  `common/.config/fish/`.
- **Editor settings**: Modify relevant config files under `common/.config/`.
- **Environment variables**: Use mise configuration files.
- **OS-specific tweak**: Add it to the matching `macos/`/`linux/` fragment.
