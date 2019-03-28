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

# Reload fish shell configuration
alias reload "reload_configuration"

### Configurations

# Asdf - leave this at the bottom of the file.
source /usr/local/opt/asdf/asdf.fish
