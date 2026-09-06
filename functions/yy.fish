function yy --wraps=yazi --description 'yazi file manager — cd to last dir on exit'
    set -l runtime_dir $XDG_RUNTIME_DIR
    test -d "$runtime_dir"; or set runtime_dir /tmp
    set -l tmp (mktemp --tmpdir="$runtime_dir" "yazi-cwd.XXXXXX"); or return
    yazi $argv --cwd-file=$tmp
    set -l result $status
    if test $result -ne 0
        command rm -f -- $tmp
        return $result
    end
    if set -l cwd (command cat -- $tmp 2>/dev/null); and test -n "$cwd"; and test "$cwd" != "$PWD"
        builtin cd -- $cwd
    end
    command rm -f -- $tmp
end
