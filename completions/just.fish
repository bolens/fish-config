# Dynamic just completions
if set -l just_completions (JUST_COMPLETE=fish just)
    string join \n -- $just_completions | source
end
