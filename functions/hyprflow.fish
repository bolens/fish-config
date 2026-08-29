function hyprflow --wraps=/usr/bin/hyprflow --description 'Serialize Hyprflow session operations'
    set -l runtime_dir $XDG_RUNTIME_DIR
    test -d "$runtime_dir"; or set runtime_dir /run/user/(id -u)
    command flock --wait 30 "$runtime_dir/hyprflow.lock" /usr/bin/hyprflow $argv
end
