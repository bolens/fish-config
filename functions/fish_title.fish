function fish_title --description 'Set title to current folder and command' --argument-names last_command
    # CachyOS packages Pure's fish_title globally. Tide does not initialize
    # Pure's length/separator variables, so keep this hook self-contained.
    set -l current_folder (fish_prompt_pwd_dir_length=1 prompt_pwd)
    set -l current_command (status current-command 2>/dev/null; or echo $_)[1]

    if test -n "$last_command"
        echo "$current_folder: $last_command · $current_command"
    else
        echo "$current_folder · $current_command"
    end
end
