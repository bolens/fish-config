# Session defaults belong in version control rather than Fish's shared
# universal-variable store. Loading these before plugin snippets prevents
# simultaneous shells from racing to initialize the same universal values.
set -g FZF_TMUX_HEIGHT '40%'
set -g FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
set -g FZF_LEGACY_KEYBINDINGS 1
set -g FZF_DISABLE_KEYBINDINGS 0
set -g FZF_PREVIEW_FILE_CMD 'head -n 10'
set -g FZF_PREVIEW_DIR_CMD ls

set -g pisces_pairs '(,)' '[,]' '{,}' '","' "','"
