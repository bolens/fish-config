# Vite+ bin (https://viteplus.dev). Keep the integration local so startup does
# not execute `vp` merely to generate its one-line dynamic completion.
set -gx VP_HOME "$HOME/.vite-plus"

# Keep vp/vpr/vpx available without letting Vite+'s bundled Node override the
# runtime selected by mise, which loads later in zz-mise.fish.
set -l vite_plus_path_index (contains -i -- "$HOME/.vite-plus/bin" $PATH)
if test -n "$vite_plus_path_index"
    set -e PATH[$vite_plus_path_index]
end
set -a PATH "$HOME/.vite-plus/bin"

# `vp env use` emits Fish commands which must affect the current shell.
function vp
    set -l command_index 1
    if test "$argv[1]" = -C
        set command_index 3
    else if string match -qr '^-C.+' -- "$argv[1]"
        set command_index 2
    end

    set -l next_index (math $command_index + 1)
    if test "$argv[$command_index]" = env; and test "$argv[$next_index]" = use
        if contains -- -h $argv; or contains -- --help $argv
            command vp $argv
            return
        end
        set -lx VP_ENV_USE_EVAL_ENABLE 1
        set -lx VP_SHELL fish
        command vp $argv | source
    else
        command vp $argv
    end
end

if status is-interactive
    complete --keep-order --exclusive --command vp --arguments "(VP_COMPLETE=fish command vp -- (commandline --current-process --tokenize --cut-at-cursor) (commandline --current-token))"
end
