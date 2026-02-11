---
name: commit-message
description: Generate high-quality git commit messages for staged changes following repository guidelines
license: MIT
---

# Commit Message Generation

This skill helps generate well-structured git commit messages that follow the repository's commit message guidelines.

## Guidelines Reference

All commit message formatting rules are defined in `.gitmessage` at the repository root. **Always reference and follow those guidelines** when generating commit messages.

Key points from `.gitmessage`:
- The subject line should complete: "If applied, this commit will..."
- Follow the seven rules for great commit messages
- Use examples in `.gitmessage` as reference for structure and tone

## Task

When asked to generate a commit message:

1. Analyze the staged changes (`git diff --cached`)
2. Apply the guidelines documented in `.gitmessage`
3. Focus on:
   - What changed and why it was necessary
   - Business or user impact when relevant
   - Migration, compatibility, or technical debt considerations

## Output Format

Provide **only** the commit message wrapped in a ```gitcommit``` code block, ready to use with `git commit -F -`.
