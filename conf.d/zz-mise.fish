# Load mise after other tool-specific environment snippets so its selected
# runtimes take precedence over bundled runtimes such as Vite+'s Node.
# `mise activate fish --shims` emits this single operation. Applying it
# directly avoids launching mise during every shell startup while retaining
# per-project tool selection through its shims.
fish_add_path --global --move --path "$HOME/.local/share/mise/shims"
