#!/bin/sh
# Claude Code status line — inspired by Pure fish prompt
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
repo=$(echo "$input" | jq -r '.workspace.repo | if . then .owner + "/" + .name else empty end')
branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)

# Shorten home directory to ~
home="$HOME"
short_cwd="${cwd/#$home/\~}"

parts=""

# Directory (bold-ish via dim ANSI since status line uses dimmed colors)
parts="${short_cwd}"

# Git branch
if [ -n "$branch" ]; then
    parts="${parts}  ${branch}"
fi

# Repo (owner/name) when available
if [ -n "$repo" ]; then
    parts="${parts}  ${repo}"
fi

# Model
if [ -n "$model" ]; then
    parts="${parts}  ${model}"
fi

# Context usage
if [ -n "$used" ]; then
    parts="${parts}  ctx:$(printf '%.0f' "$used")%"
fi

printf '%s' "$parts"
