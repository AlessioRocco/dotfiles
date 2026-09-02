### Variables

# Disable the fish welcome message
set -g fish_greeting

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set LazyVim as the default nvim app
set -xg NVIM_APPNAME nvim-lazyvim

# Herdr's pty doesn't answer Nvim's startup DSR query for background-color
# detection, which throws E1568 and slows startup. Skip the query there.
if set -q HERDR_ENV
    set -xg NVIM_NOTTYFAST 1
end

# Set NeoVim as the default editor.
set -xg EDITOR nvim

# Set LazyVim as editor for opening gems
set -xg BUNDLER_EDITOR $EDITOR

# Set the default home directory for XDG
# This is needed for lazygit to use the correct config directory
# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md#user-config
set -xg XDG_CONFIG_HOME ~/.config

# Lazygit: load Catppuccin Macchiato theme alongside the main config
set -xg LG_CONFIG_FILE $HOME/.config/lazygit/theme.yml,$HOME/.config/lazygit/config.yml

### Configurations

# Theme
fish_config theme choose --color-theme=dark catppuccin-macchiato

# Add ~/.bin to the $PATH
fish_add_path --move ~/.bin

# Add ~/.local/bin to the $PATH (rtk's install location)
fish_add_path --move ~/.local/bin

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

# Alessio's own nvim config (avim), as an alt profile to the default LazyVim
alias avim "NVIM_APPNAME=avim nvim"

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

# Noctalia
abbr noctalia-export "noctalia config export > ~/.config/noctalia/config.toml"

# Herdr
abbr s herdr-workspace-setup

### Homebrew
# Homebrew environment is set up per-OS in conf.d/os.fish.

### Zoxide
zoxide init fish | source

# Mise
mise activate fish | source

# Herdr: rename the tab to the running foreground command, falling back to a
# short idle label while the shell is at the prompt. The idle label uses the
# repo's main folder name (shared across all its worktrees) instead of the
# current worktree's directory name, which worktrunk derives from the whole
# branch (user/ticket/description) and can get long.
if status is-interactive && set -q HERDR_ENV && set -q HERDR_TAB_ID
    function _herdr_idle_label
        if test "$PWD" = "$HOME"
            echo "~"
            return
        end
        set -l git_common (command git rev-parse --path-format=absolute --git-common-dir 2>/dev/null)
        if test -n "$git_common"
            basename (dirname -- $git_common)
            return
        end
        basename $PWD
    end

    function _herdr_tab_name_idle --on-variable PWD
        set -g _herdr_idle_label_cache (_herdr_idle_label)
        herdr tab rename "$HERDR_TAB_ID" "$_herdr_idle_label_cache" >/dev/null 2>&1
    end

    function _herdr_tab_name_running --on-event fish_preexec
        set -l label (string split -m1 ' ' -- (string trim -- $argv[1]))[1]
        herdr tab rename "$HERDR_TAB_ID" "$label" >/dev/null 2>&1
    end

    function _herdr_tab_name_reset --on-event fish_postexec
        herdr tab rename "$HERDR_TAB_ID" "$_herdr_idle_label_cache" >/dev/null 2>&1
    end

    _herdr_tab_name_idle
end

# Prompt
starship init fish | source
