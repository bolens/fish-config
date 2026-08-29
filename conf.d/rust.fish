# Keep optimization and target CPU policy in Cargo profiles or project config.
# Global RUSTFLAGS slow debug builds, fragment caches, and make artifacts less
# portable. rustup.fish handles adding ~/.cargo/bin to PATH.
set -e RUSTFLAGS
