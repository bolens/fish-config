# Fix inherited environment pollution from /etc/environment and profile.d scripts
# that don't expand variables correctly or run multiple times.

# /etc/environment contains a literal, unexpanded $LD_LIBRARY_PATH entry.
# Do not replace it with a global mold library override: that can change library
# resolution for every dynamically linked program. Keep Fish sessions clean
# until the system-level entry can be removed.
set -e LD_LIBRARY_PATH

# Session managers and nested login shells may source package profile snippets
# more than once. Preserve first-match precedence while removing duplicates.
set -l clean_path
for path_entry in $PATH
    contains -- "$path_entry" $clean_path; or set -a clean_path "$path_entry"
end
set -gx PATH $clean_path

# Unset QML2_IMPORT_PATH: previously set globally by /etc/profile.d/meshroom.sh
# (now disabled). That script prepended /usr/lib/qt/qml (Qt5) to QML2_IMPORT_PATH,
# causing Qt6 apps (like plasma-discover) to load wrong QML modules and crash.
# Meshroom sets this itself via its wrapper script (/usr/bin/meshroom) when needed.
set -e QML2_IMPORT_PATH

# Deduplicate MESHROOM_*_PATH vars (profile.d sourced multiple times causes tripling)
if set -q MESHROOM_NODES_PATH
    set -gx MESHROOM_NODES_PATH /usr/share/meshroom
end
if set -q MESHROOM_PIPELINE_TEMPLATES_PATH
    set -gx MESHROOM_PIPELINE_TEMPLATES_PATH /usr/share/meshroom
end
