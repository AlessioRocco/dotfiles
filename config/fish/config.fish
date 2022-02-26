### Variables

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set NeoVim as the default editor.
set -xg EDITOR "nvim"

# Editor for opening gems
set -xg BUNDLER_EDITOR "nvim"

# Use ripgrep as default command for fzf
set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden'

# Set GPG TTY
set -xg GPG_TTY (tty)

# Set $PATH
set PATH ~/.bin $PATH

# Add "/usr/local/sbin" to the user paths to fix the Homebrew doctor Warning:
#
# Warning: Homebrew's "sbin" was not found in your PATH but you have installed
# formulae that put executables in /usr/local/sbin.
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

### Aliases

# Git/Hub
alias g "git_or_gitsh"

# Reload fish shell configuration
alias reload "reload_configuration"

# Editor
alias e "editor"

# Edit host database file
alias eh "sudo vim /etc/hosts"

# Restart postgresql
alias pgr "restart_postgresql"

# Kill process
alias kp "kill_process"

# Rails
alias r "bin_or_bundle_rails"
alias rs "bin_or_bundle_rails server"
alias rc "bin_or_bundle_rails console"

### Abbreviations

# Bundler
abbr b "bundle"
abbr be "bundle exec"
abbr bi "bundle install"
abbr bu "bundle update"
abbr bo "bundle open"

### Configurations

# Asdf - leave this at the bottom of the file.
source /usr/local/opt/asdf/asdf.fish
