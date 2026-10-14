# Dotfiles

Personal macOS and Linux environment, including how new git worktrees
get prepared no matter which tool created them.

## Language

### Worktrees

**Primary worktree**:
The repo's main working tree: the source every other worktree is set
up from.
_Avoid_: main worktree, root checkout

**Shared path**:
A gitignored path, listed in the primary's `.worktreelink`, that every
other worktree symlinks back to the primary, so all see one copy.
_Avoid_: linked file

**Seeded path**:
A gitignored path, listed in `.worktreeinclude`, copied from the
primary when a worktree is created and owned by that worktree after.
_Avoid_: copied path, included file

**Worktree setup**:
Applying a repo's shared and seeded paths to a newly created worktree.
_Avoid_: worktree init
