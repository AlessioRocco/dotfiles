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

# Lazygit: load Catppuccin Macchiato theme alongside the main config
set -xg LG_CONFIG_FILE $HOME/.config/lazygit/theme.yml,$HOME/.config/lazygit/config.yml

### Configurations

# Theme
fish_config theme choose --color-theme=dark catppuccin-macchiato

# Add ~/.bin to the $PATH
fish_add_path --move ~/.bin

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

### Homebrew
# Homebrew environment is set up per-OS in conf.d/os.fish.

### Zoxide
zoxide init fish | source

# Mise
~/.local/bin/mise activate fish | source

# Herdr: rename the tab to the running foreground command, falling back to
# $PWD's directory name while the shell is idle at the prompt.
if status is-interactive && set -q HERDR_ENV && set -q HERDR_TAB_ID
    function _herdr_tab_name_idle --on-variable PWD
        set -l label (basename $PWD)
        if test "$PWD" = "$HOME"
            set label "~"
        end
        herdr tab rename "$HERDR_TAB_ID" "$label" >/dev/null 2>&1
    end

    function _herdr_tab_name_running --on-event fish_preexec
        set -l label (string split -m1 ' ' -- (string trim -- $argv[1]))[1]
        herdr tab rename "$HERDR_TAB_ID" "$label" >/dev/null 2>&1
    end

    function _herdr_tab_name_reset --on-event fish_postexec
        _herdr_tab_name_idle
    end

    _herdr_tab_name_idle
end

# Prompt
starship init fish | source
