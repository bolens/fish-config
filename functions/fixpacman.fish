function fixpacman --description 'Remove a stale pacman database lock safely'
    set -l lock_file /var/lib/pacman/db.lck
    if not test -e "$lock_file"
        echo 'No pacman database lock exists.'
        return 0
    end

    command -q fuser; and command -q sudo; or begin
        echo 'Cannot inspect the lock: fuser and sudo are required.' >&2
        return 1
    end

    # fuser uses nonzero for both no owner and fatal errors. Keep diagnostics
    # visible to this decision instead of treating every failure as a stale lock.
    set -l probe_output (sudo fuser -- "$lock_file" 2>&1)
    set -l probe_status $status
    if test $probe_status -eq 0
        echo 'Refusing to remove an active pacman database lock.' >&2
        return 1
    end
    if test $probe_status -ne 1; or test -n "$probe_output"
        echo 'Cannot establish that the pacman lock is unused; leaving it intact.' >&2
        return 1
    end

    sudo rm -- "$lock_file"
end
