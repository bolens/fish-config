# Implementation plan

Pin devenv and nixpkgs, supply Fish plus existing hook validators, and expose
`repo-check` through the native pre-push hook. Add Python adapter tests, source
lint for maintained tooling and documentation, and a filtered Linux/macOS matrix
with real Docker validation and a stable aggregate check.

Run native and rootless Podman checks before PR delivery. Require current-head
hosted checks, protected squash merge, main CI, and verified branch cleanup.
This change adds development tooling; no source release or live installation is
required. Preserve startup behavior and managed Spec Kit/Fisher content.
