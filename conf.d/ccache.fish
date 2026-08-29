# ccache — speeds up repeated C/C++ compiles (makepkg, cmake, meson, Rust C deps).
if not type -q ccache
    exit
end

set -gx CCACHE_DIR "$HOME/.cache/ccache"
set -gx CCACHE_MAXSIZE 20G
set -gx CCACHE_COMPRESS true
set -gx CCACHE_COMPRESSLEVEL 6
set -gx CCACHE_BASEDIR "$HOME"
# Keep correctness-sensitive hardlink and sloppiness policies project-local.
# Build systems should opt in with their native launcher support, for example:
#   cmake -DCMAKE_C_COMPILER_LAUNCHER=ccache \
#         -DCMAKE_CXX_COMPILER_LAUNCHER=ccache ...

# Optional clang path when using CC=clang in a project.
function ccache-cmake-clang -d 'Run CMake tooling with ccache-wrapped clang/clang++'
    set -lx CC clang
    set -lx CXX clang++
    set -lx CMAKE_C_COMPILER_LAUNCHER ccache
    set -lx CMAKE_CXX_COMPILER_LAUNCHER ccache
    command $argv
end
