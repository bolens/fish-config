function cleanup -d 'Remove orphaned packages (pacman)'
    command -q pacman; or begin
        echo 'pacman is not installed' >&2
        return 1
    end
    set -l diagnostics (mktemp); or return
    set -l pkgs (pacman -Qtdq 2>"$diagnostics")
    set -l query_status $status
    set -l query_failed 0
    if test $query_status -eq 1; and test -n "$pkgs"
        set query_failed 1
    end
    if test $query_status -gt 1; or test -s "$diagnostics"
        command cat -- "$diagnostics" >&2
        set query_failed 1
    end
    command rm -f -- "$diagnostics"
    if test $query_failed -eq 1
        echo 'Cannot query orphaned packages; no removal attempted.' >&2
        return 1
    end
    if test -z "$pkgs"
        echo "No orphaned packages to remove."
        return 0
    end
    sudo pacman -Rns $pkgs
end
