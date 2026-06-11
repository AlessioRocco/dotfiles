### Variables

# Disable the fish welcome message
set -g fish_greeting

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set LazyVim as the default nvim app
set -xg NVIM_APPNAME nvim-lazyvim

# Set NeoVim as the default editor.
set -xg EDITOR nvim

# Set LazyVim as editor for opening gems
set -xg BUNDLER_EDITOR $EDITOR

# Set the default home directory for XDG
# This is needed for lazygit to use the correct config directory
# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md#user-config
set -xg XDG_CONFIG_HOME ~/.config

### Configurations

# Theme
fish_config theme choose catppuccin-macchiato

# Add ~/.bin to the $PATH
fish_add_path --move ~/.bin

# Add libpq to the $PATH
fish_add_path /opt/homebrew/opt/libpq/bin

# Use Homebrew's OpenJDK
fish_add_path /opt/homebrew/opt/openjdk/bin

### Aliases

# Git/GitHub CLI
alias g git_or_lazygit

# Reload fish shell configuration
alias reload reload_configuration

# Editor
alias editor $EDITOR
alias e editor

# Edit host database file
alias eh "sudo vim /etc/hosts"

# Kill process
alias kp kill_process

### Abbreviations

# GitHub CLI
abbr h gh

# Rails
abbr r rails
abbr k rake

# Bundler
abbr b bundle
abbr be "bundle exec"
abbr bi "bundle install"
abbr bu "bundle update"
abbr bo "bundle open"

### Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

### Zoxide
zoxide init fish | source

# Mise
~/.local/bin/mise activate fish | source

# Auto-attach to tmux on shell startup
if status is-interactive && not set -q TMUX
    sesh connect home
end
