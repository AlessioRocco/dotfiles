# AGENTS.md

Dotfiles repository for macOS development environment configuration.
Uses `rcm` for symlink management and shell scripts for idempotent setup.

## Setup commands

- Bootstrap environment: `./bin/setup`
- Link dotfiles: `rcup`
- Update symlinks after changes: `rcup`
- Test setup idempotency: `./bin/setup` (should run without errors)

## Project structure

- `bin/setup`: Main installation script with Homebrew bundle
- `rcrc`: Configuration for rcm dotfile manager
- Configuration files: Auto-symlinked to `$HOME` by rcm
- `editorconfig`: Code style rules for all file types
- `gitmessage`: Commit message template with guidelines

## Tech stack

- **rcm**: Dotfile symlink management (config in `rcrc`)
- **Homebrew**: Package management (bundle in `bin/setup`)
- **fish**: Default shell with custom configurations
- **mise**: Runtime and environment variable management
- **atuin**: Shell history synchronization

## Code style

- Follow rules in `editorconfig` (2-space indent, UTF-8, LF endings)
- Shell scripts: Match existing patterns in `bin/` directory
- Max line length: 80 characters (72 for markdown/shell)

## File management

- **New config files**: Place in repository root or appropriate subdirectory
- **Exclude from symlinking**: Add to `EXCLUDES` in `rcrc`
- **New dependencies**: Add to brew bundle in `bin/setup`
- **Directory structure**: Mirrors `$HOME` layout for automatic symlinking

## Testing approach

No automated tests. Manual verification required:

1. Run `./bin/setup` for dependency installation
2. Run `rcup` to update symlinks
3. Reload shell: `exec fish` or restart terminal
4. Restart affected applications (WezTerm, Neovim, etc.)
5. Verify configuration changes take effect

## Commit guidelines

Follow the Git commit message convention documented in

@./gitmessage

Write commit messages that:

- Use imperative mood in the subject line (max 50 chars): "Fix bug", "Add feature"
- Capitalize the subject line and don't end with a period
- Separate subject from body with a blank line
- Wrap the body at 72 characters
- Explain what and why, not how - focus on reasoning, user impact, and context
- Complete the sentence: "If applied, this commit will [your subject line]"

Good commit descriptions should answer:

- Why is it necessary?
- How does it address the issue?
- What effects does the change have?

## Common tasks

- **Add Homebrew package**: Edit brew bundle in `bin/setup`
- **New shell alias/function**: Add to appropriate fish config file
- **Editor settings**: Modify relevant config files (neovim, vscode, etc.)
- **Environment variables**: Use mise configuration files
- **Exclude sensitive files**: Update `rcrc` EXCLUDES list
