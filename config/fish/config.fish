### Variables

# Load secrets if present
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# Add 'code' folder in the CDPATH.
set -xg CDPATH . ~/code

# Set LazyVim as the default editor.
set -xg EDITOR "NVIM_APPNAME=lazyvim nvim"

# Set LazyVim as editor for opening gems
set -xg BUNDLER_EDITOR $EDITOR

# Set the default home directory for XDG
# This is needed for lazygit to use the correct config directory
# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md#user-config
set -xg XDG_CONFIG_HOME ~/.config

# Use fd as default command for fzf
# Also the author of rigrep recommends using fd
# https://www.reddit.com/r/linux4noobs/comments/egb644/fzf_newcomer_fd_or_ripgrep/fc5li3r/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
# https://github.com/sharkdp/fd#using-fd-with-fzf
set -xg FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --color=always'
set -xg FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -xg FZF_DEFAULT_OPTS --ansi

# Set the theme for fzf
source ~/.config/fzf/themes/catppuccin_macchiato.fish

# Force GitHub CLI to use colors
set -xg CLICOLOR_FORCE true
set -xg GH_FORCE_TTY true
set -xg GLAMOUR_STYLE dark

# Fix Rails issue with MacOS
# https://github.com/rails/rails/issues/38560
set -xg OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

# Fix for Postgres Segmentation fault
# https://github.com/ged/ruby-pg/issues/538#issuecomment-1591629049
set -xg PGGSSENCMODE disable

### Configurations

# Add ~/bin to the $PATH
fish_add_path --move ~/bin

# Add libpq to the $PATH
fish_add_path /opt/homebrew/opt/libpq/bin

# ASDF configuration code - https://asdf-vm.com/
# https://asdf-vm.com/guide/getting-started.html#_2-configure-asdf
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Use .git/safe to add trusted bin into the path
#
# https://thoughtbot.com/blog/git-safe
fish_add_path --move .git/safe/../../bin

# Use Homebrew's OpenJDK
fish_add_path /opt/homebrew/opt/openjdk/bin

### Aliases

# Git/GitHub CLI
alias g git_or_lazygit
alias pr fzf_pull_requests

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
