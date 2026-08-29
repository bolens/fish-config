# Tide uses one universal variable per interactive process to share asynchronous
# prompt results. Remove entries left by crashed or force-closed shells while
# preserving variables owned by Fish processes that are still alive.
if status is-interactive
    for prompt_var in (set -U --names | string match '_tide_prompt_*')
        set -l prompt_pid (string replace '_tide_prompt_' '' -- "$prompt_var")
        kill -0 "$prompt_pid" 2>/dev/null; or set -Ue $prompt_var
    end
end
