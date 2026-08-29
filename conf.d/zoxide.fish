# zoxide Fish shell integration
set -gx _ZO_DATA_DIR "$HOME/.local/share/zoxide"

if status is-interactive; and command -q zoxide
    zoxide init fish | source
end
