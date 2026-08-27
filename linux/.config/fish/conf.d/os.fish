# Linux-specific fish configuration.
# Auto-sourced by fish from ~/.config/fish/conf.d/.
# Stowed from the `linux` package.

# Add binaries installed via `cargo install` (e.g. tokensave) to the
# $PATH. Rustup's own shims for cargo/rustc already live on $PATH via
# /usr/lib/rustup/bin, but that's separate from where `cargo install`
# puts its output.
fish_add_path ~/.cargo/bin
