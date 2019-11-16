### Variables

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set NeoVim as the default editor.
set -xg EDITOR "nvim"

# Editor for opening gems
set -xg BUNDLER_EDITOR "nvim"

# Use fzf new keybindings
set -U FZF_LEGACY_KEYBINDINGS 0

# Use ripgrep as default command for fzf
set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden --no-ignore-vcs'

# Set $PATH
set PATH ~/.bin $PATH

### Aliases

# Git/Hub
alias g "git_or_gitsh"

# Reload fish shell configuration
alias reload "reload_configuration"

# Editor
alias e "editor"

# Edit host database file
alias eh "sudo vim /etc/hosts"

### Abbreviations

# Bundler
abbr b "bundle"
abbr be "bundle exec"
abbr bi "bundle install"
abbr bu "bundle update"
abbr bo "bundle open"

### Configurations

# Automatically set gruvbox dark with medium contrast as theme
if type -q theme_gruvbox
  theme_gruvbox dark medium
end

# Asdf - leave this at the bottom of the file.
source /usr/local/opt/asdf/asdf.fish
