---
name: pull-request
description: Generate GitHub pull request based on commit history with confirmation
license: MIT
---

# Pull Request Generation

This skill helps generate GitHub pull requests based on commit history.

## Template Reference

The PR description format is defined in `.github/pull_request_template.md` at the repository root. **Always reference and follow that template** when generating pull request descriptions.

## Task

When asked to create a pull request:

1. Analyze the commit history between the current branch and the base branch
2. Generate a PR title following project conventions
3. Create a description following the template structure in `.github/pull_request_template.md`
4. Present the proposed PR for confirmation
5. After confirmation, create the PR using GitHub CLI

## Output Format

Present the proposed PR for confirmation in this format:

```markdown
**Title:** [Your PR title here]

**Description:**
[Your PR description following the template]
```

After confirmation, create the PR using `gh pr create --title "..." --body "..."`
