# Notify when a long command finishes after its Omarchy/Hyprland terminal loses
# focus. This intentionally replaces the cross-platform Fisher `done` plugin.
status is-interactive; or exit
test -n "$HYPRLAND_INSTANCE_SIGNATURE"; or exit
command -q hyprctl; and command -q notify-send; or exit

set -g __done_min_duration_ms 5000
set -g __done_exclude '^git (?!push|pull|fetch)'
set -g __done_initial_window

function __done_active_window
    set -l first_line (hyprctl activewindow 2>/dev/null)[1]
    set -l fields (string split ' ' -- "$first_line")
    test (count $fields) -ge 2; and string trim -- "$fields[2]"
end

function __done_human_duration --argument-names milliseconds
    set -l total_seconds (math --scale=0 "$milliseconds / 1000")
    set -l hours (math --scale=0 "$total_seconds / 3600")
    set -l minutes (math --scale=0 "$total_seconds / 60 % 60")
    set -l seconds (math --scale=0 "$total_seconds % 60")

    test "$hours" -gt 0; and printf '%sh ' $hours
    test "$minutes" -gt 0; and printf '%sm ' $minutes
    printf '%ss' $seconds
end

function __done_started --on-event fish_preexec
    set -g __done_initial_window (__done_active_window)
end

function __done_finished --on-event fish_postexec
    set -l exit_status $status
    set -l duration $CMD_DURATION
    set -l commandline $argv[1]

    test -n "$duration"; and test "$duration" -gt "$__done_min_duration_ms"; or return
    string match -qr -- "$__done_exclude" "$commandline"; and return

    set -l current_window (__done_active_window)
    test -n "$__done_initial_window"; and test "$current_window" != "$__done_initial_window"; or return

    set -l elapsed (__done_human_duration "$duration")
    set -l title "Done in $elapsed"
    set -l urgency normal
    if test "$exit_status" -ne 0
        set title "Failed ($exit_status) after $elapsed"
        set urgency critical
    end

    set -l directory (string replace --regex "^$HOME" '~' "$PWD")
    notify-send --hint=int:transient:1 --urgency="$urgency" \
        --icon=utilities-terminal --app-name=fish --expire-time=3000 \
        "$title" "$directory/ $commandline"
end
