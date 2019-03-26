### Variables

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set NeoVim as the default editor.
set -xg EDITOR "nvim"

# Set $PATH
set PATH ~/.bin $PATH

### Configurations

# Asdf - leave this at the bottom of the file.
source /usr/local/opt/asdf/asdf.fish
