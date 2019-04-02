### Variables

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set NeoVim as the default editor.
set -xg EDITOR "nvim"

# Use fzf new keybindings
set -U FZF_LEGACY_KEYBINDINGS 0

# Set $PATH
set PATH ~/.bin $PATH

### Aliases

# Git/Hub
alias g "git_or_gitsh"

# Reload fish shell configuration
alias reload "reload_configuration"

# Editor
alias e "editor"

### Configurations

# Automatically set gruvbox dark with medium contrast as theme
if type -q theme_gruvbox
  theme_gruvbox dark medium
end

# Asdf - leave this at the bottom of the file.
source /usr/local/opt/asdf/asdf.fish
