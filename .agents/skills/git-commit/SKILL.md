---
name: git-commit
description: Generate high-quality git commits with context-awareness and multi-commit support
---

# Git Commit Skill

Generate well-structured git commits following the seven rules of great
commit messages. This skill handles single commits, multi-commit plans,
and interactive workflows. Of the seven rules, Rule 7 — **use the body
to explain what and why, not how** — is the most important to internalize.

_Guidelines based on: <https://cbea.ms/git-commit/>_

## Commit Message Rules

### 1. Separate subject from body with a blank line

Git tools (`log`, `shortlog`, `rebase`) depend on this separation.
Simple changes need only a subject. Add a body when the motivation
isn't obvious from the code, when there are side effects to explain,
or when the change requires context.

### 2. Aim for 50 characters in the subject, keep it under ~72

50 characters is the target — it forces concise thinking. Around 72
characters is a commonly recommended maximum; many tools wrap or
truncate beyond this. If you struggle to summarize, the commit may be
doing too many things.

### 3. Capitalize the subject line

Start with an uppercase letter. No exceptions.

### 4. Do not end the subject line with a period

Trailing punctuation is unnecessary in a title-style line.

### 5. Use the imperative mood in the subject line

The subject should complete: "If applied, this commit will **[subject]**"

- "If applied, this commit will **refactor subsystem X for readability**"
  — correct
- "If applied, this commit will **fixed bug with Y**" — wrong (past tense)
- "If applied, this commit will **more fixes for broken stuff**"
  — wrong (no verb)

Imperative mood is required only in the subject. The body can be
conversational.

### 6. Wrap the body at 72 characters

Git doesn't wrap automatically. 72 characters leaves room for
indentation while staying under 80 columns.

### 7. Use the body to explain what and why, not how

This is the most important rule. The diff shows WHAT changed and the
code shows HOW. The commit message's job is to explain WHY.

Specifically explain:

- What problem this commit solves and why the change was necessary
- Why this approach was chosen (if not obvious)
- Side effects, trade-offs, or unintuitive consequences
- What was wrong with the previous behavior

## Message Structure

### Subject only

For simple, self-explanatory changes:

```gitcommit
Add fish abbreviation for git status
```

### Subject + body

When motivation isn't obvious from the diff:

```gitcommit
Switch default shell history to atuin

The built-in fish history doesn't sync across machines. Atuin stores
history in a local SQLite database and optionally syncs it, which
makes it easier to recall commands run on other hosts.
```

## Writing style

Write commit message bodies as natural prose — like explaining a change
to a colleague. Prefer flowing paragraphs that tell the story of why
the change was needed. Bullet points are acceptable when listing
genuinely helps clarity, but default to prose. Avoid "Files changed:"
sections — the diff already shows what changed.

## Examples

These demonstrate the preferred style: natural prose focused on the WHY.

### Tool or package addition

```gitcommit
Add ripgrep to Homebrew bundle

Using rg as the default search backend for fzf and neovim's telescope.
Declaring it explicitly here ensures it's present after a fresh
bootstrap rather than relying on it being a transitive dependency.
```

### Refactoring with rationale

```gitcommit
Extract editor config into separate fish function

The editor selection logic was duplicated between the interactive
config and the non-interactive profile. Moving it into a dedicated
set_editor function keeps both paths in sync and makes it easier
to add fallback editors later.
```

### Fixing a broken config

```gitcommit
Fix WezTerm failing to start on macOS Sequoia

The lua config was referencing wezterm.target_triple to detect the
platform, which was removed in a recent release. Switch to checking
wezterm.running_under_wayland() and the TERM_PROGRAM env var instead,
which works across versions.
```

### Dotfile exclusion

```gitcommit
Exclude .env files from rcm symlinking

Accidentally symlinking .env files would expose secrets on any
machine that runs rcup. Adding them to EXCLUDES in rcrc prevents
that without requiring manual cleanup after each bootstrap.
```

## Workflow

### 1. Identify what to commit

- If the user staged changes: verify staged changes exist
  (`git diff --cached`). If nothing is staged, stop and inform the user.
- If the agent generated changes: analyze all uncommitted changes
  (staged, unstaged, untracked files the agent created).

### 2. Gather context

This is a dotfiles repository. All commits go directly to `master` —
there are no feature branches or pull requests. Run
`git log -5 --oneline` to get a sense of recent activity and commit
style. The last 5 commits may be entirely unrelated to each other;
use them to calibrate tone and style, not to infer a narrative.

### 3. Plan the commits

Most dotfiles changes warrant a single commit. If changes span
genuinely unrelated concerns, group them into separate atomic commits,
each with a clear subject.

### 4. Draft messages

Apply all seven rules. Use the recent commit history to match tone and
style, but describe only what the specific commit does. If you cannot
deduce the motivation with confidence, ask the user rather than
inventing reasoning.

### 5. Present and execute

Show the proposed message in a `gitcommit` block and wait for approval.
The user may iterate on the message before accepting. For multiple
commits, present the full plan first, then execute sequentially only
after approval.

## Conventions

This repository has a `.gitmessage` commit template — check it for any
additional guidance before drafting.
