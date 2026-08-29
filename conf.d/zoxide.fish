# zoxide Fish shell integration
set -gx _ZO_DATA_DIR "$HOME/.local/share/zoxide"

if status is-interactive; and command -q zoxide
    if set -l zoxide_init (zoxide init fish)
        string join \n -- $zoxide_init | source
    end
end
