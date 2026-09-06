# Fish configuration development environment

Provide locked Fish syntax and repository automation tools through devenv and
source-free Docker, rootless Podman, and Apple container adapters. Validate each
Fish source separately with `fish --no-execute`; preserve committed Fisher files,
startup modules, completions, and private configuration boundaries.

The environment must not source or install the configuration, run Fisher updates,
or change live shell state. Syntax checks do not establish startup latency or
runtime integration behavior. Container commands preserve argument boundaries,
caller ownership, and child failures. Apple execution requires supported Mac
hardware and a Linux Nix builder; record unavailable validation explicitly.
