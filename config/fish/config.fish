### Variables

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set NeoVim as the default editor.
set -xg EDITOR "nvim"

# Editor for opening gems
set -xg BUNDLER_EDITOR "nvim"

# Use ripgrep as default command for fzf
set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden'

# Force GitHub CLI to use colors
set -xg CLICOLOR_FORCE true
set -xg GH_FORCE_TTY true
set -xg GLAMOUR_STYLE 'dark'

### Configurations

# Set GPG TTY
set -xg GPG_TTY (tty)

# Add "/usr/local/sbin" to the user paths to fix the Homebrew doctor Warning:
#
# Warning: Homebrew's "sbin" was not found in your PATH but you have installed
# formulae that put executables in /usr/local/sbin.
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Use asdf - https://asdf-vm.com/
#
# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
source /usr/local/opt/asdf/libexec/asdf.fish

# Use .git/safe to add trusted bin into the path
#
# https://thoughtbot.com/blog/git-safe
fish_add_path --move .git/safe/../../bin

### Aliases

# Git/GitHub CLI
alias g "git_or_gitsh"
alias pr "fzf_pull_requests"

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

# GitHub CLI
abbr h "gh"

# Bundler
abbr b "bundle"
abbr be "bundle exec"
abbr bi "bundle install"
abbr bu "bundle update"
abbr bo "bundle open"
