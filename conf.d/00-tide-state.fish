# Tide uses one universal variable per interactive process to share asynchronous
# prompt results. Remove entries left by crashed or force-closed shells while
# preserving variables owned by Fish processes that are still alive.
if status is-interactive
    command -q pgrep; or exit
    set -l prompt_vars (set -U --names | string match '_tide_prompt_*')

    # Normal exits remove their own variable. Only scan processes after enough
    # abnormal exits accumulate to justify touching shared universal state.
    if test (count $prompt_vars) -gt 5
        set -l live_fish_pids (pgrep -x fish)
        for prompt_var in $prompt_vars
        set -l prompt_pid (string replace '_tide_prompt_' '' -- "$prompt_var")
            contains -- "$prompt_pid" $live_fish_pids; or set -Ue $prompt_var
        end
    end
end
