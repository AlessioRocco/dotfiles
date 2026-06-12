# macOS-specific fish configuration.
# Auto-sourced by fish from ~/.config/fish/conf.d/.
# Stowed from the `macos` package.

# Homebrew (Apple Silicon prefix)
if test -x /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# Add libpq to the $PATH
fish_add_path /opt/homebrew/opt/libpq/bin

# Use Homebrew's OpenJDK
fish_add_path /opt/homebrew/opt/openjdk/bin
