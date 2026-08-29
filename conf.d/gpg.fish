# GPG agent setup. Keychain owns SSH_AUTH_SOCK in private.fish.

if status is-interactive
    set -gx GPG_TTY (tty)
end
