# Show fastfetch only in the top-level interactive shell. Nested Fish sessions
# stay quiet and start faster.
function fish_greeting
	if test "$SHLVL" -le 1; and type -q fastfetch
		fastfetch
	end
end

# Paths not owned by mise. fish_add_path is idempotent and ignores missing
# directories, so it is safe in both interactive and non-interactive shells.
fish_add_path --global -p "$HOME/go/bin"
fish_add_path --global -a "$HOME/.local/bin"
fish_add_path --global -a "$HOME/.pixi/bin"

# Keep vcpkg and Nix tools consistent in fish sessions.
set -gx VCPKG_ROOT "$HOME/.local/share/vcpkg"
set -gx VCPKG_DISABLE_METRICS "1"
set -gx NIX_CONFIG "experimental-features = nix-command flakes"

# Normalize locale in Fish sessions to a generated UTF-8 locale.
set -e -g LANGUAGE
set -e -g LC_ALL
for _locale_var in LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION
    set -e -g $_locale_var
end
set -gx LANG "en_US.UTF-8"

# Use micro for tools that honor EDITOR/VISUAL (e.g. sudoedit).
set -gx EDITOR "micro"
set -gx VISUAL "code-wait"

# Configure ripgrep configuration file path
set -gx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

# Activate the current opam switch when an OCaml project selects one.
test -r "$HOME/.opam/opam-init/init.fish" && source "$HOME/.opam/opam-init/init.fish" >/dev/null 2>/dev/null; or true

if status is-interactive
    # Expand discoverable shortcuts in the command line without shadowing the
    # standard commands that scripts and copied examples expect.
    abbr --add --global y yazi
    abbr --add --global ytdl yt-dlp
    abbr --add --global f fd
    abbr --add --global rgi 'rg --hidden --pcre2'
    abbr --add --global diskfree duf
    abbr --add --global diskuse dust
    abbr --add --global http curlie
    abbr --add --global dns dog
    abbr --add --global monitor btop
    abbr --add --global repeat viddy
    abbr --add --global get_idf 'source /opt/esp-idf/export.fish'
    abbr --add --global nvrun 'env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only'
end
