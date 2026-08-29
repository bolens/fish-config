function fixpacman --description 'Remove a stale pacman database lock safely'
    set -l lock_file /var/lib/pacman/db.lck
    if not test -e "$lock_file"
        echo 'No pacman database lock exists.'
        return 0
    end

    # A present lock prevents new pacman writers from starting, so checking its
    # current owner before removal closes the unsafe concurrent-writer path.
    if sudo fuser --silent -- "$lock_file"
        echo 'Refusing to remove an active pacman database lock.' >&2
        return 1
    end

    sudo rm -- "$lock_file"
end
