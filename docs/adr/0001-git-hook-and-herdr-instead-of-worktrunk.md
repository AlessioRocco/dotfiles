# A git hook and Herdr instead of a worktree manager

I've dropped worktrunk (`wt`). Its hooks were the only thing that opened
a Herdr workspace for a new worktree and closed it on removal, so
worktrees created by Herdr's menu, lazygit, Claude Code or plain `git
worktree add` never reached the sidebar, and I had stopped using
anything else it offered (picker, `wt list`, `wt merge`, LLM commit
messages). Now a global git `post-checkout` hook (`git-worktree-setup`)
does the worktree setup and opens the workspace for every new worktree,
whoever created it, and the scripts and keybindings that called `wt
switch` ask Herdr to open the branch's worktree, or create it when
there is none.

## Consequences

- git has no hook for switching to an existing worktree or for removing
  one, so each caller handles "open the existing one" itself, and
  removal has no lifecycle hook: I remove worktrees with lazygit's
  native remove or `herdr worktree remove`. Nothing closes the workspace
  of a worktree removed outside Herdr. Neither deletes the branch.
- Herdr only accepts the primary worktree as the source of an open or a
  create, so every caller resolves it first.
- New worktrees land under one root, `~/code/.worktrees/<repo>/<branch>`,
  set in Herdr's `worktrees.directory` and suggested by lazygit's
  `worktree.defaultPath`. Two repos with the same directory name share
  `<root>/<repo>/`, which I accept. Claude Code's own worktrees stay in
  `.claude/worktrees/`: Claude refuses a symlinked directory there, and
  its `WorktreeCreate`/`WorktreeRemove` hooks would bring back custom
  create and remove tooling.
- Before adding another worktree manager, check that the hook plus Herdr
  really can't do the job: the point of this change was one tool fewer
  between me and git.
