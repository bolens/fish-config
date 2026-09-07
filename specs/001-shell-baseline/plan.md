# Plan: Fish startup and maintained shell configuration

The [specification](spec.md) preserves existing behavior. Use the project guide
and constitution for implementation constraints. Keep upstream-managed templates,
helpers, and integration manifests unchanged.

## Source ownership

- `config.fish`
- `conf.d`
- `functions`
- `completions`
- `fish_plugins`
- `.gitignore`
- `.githooks/pre-push`

## Constitution check

Preserve source ownership, optional tools, private state exclusions, and the separation between repository delivery and live desktop customization.

## Validation

```sh
bash .githooks/pre-push
```

Run checks in an isolated checkout. Commands are instructions, not evidence of
a pass. Record results in `coverage.md`, keep incomplete work in `tasks.md`, and
follow `RELEASING.md` for reviewed delivery. No live operation is required solely
to create this retrospective baseline.

## Capability extension: 2026-09-06

Map every tracked startup module, function family, completion surface and supporting
maintenance file at `3bc6cc8`. Add individual command contracts and vendored-plugin
ownership, without running Fisher or replacing live configuration. Correct only
reproduced FR-006–010 discrepancies in existing functions/modules. Synthetic
command stubs and isolated HOME/XDG roots establish failure/status, key-binding
ownership and temporary-file behavior. Run all Fish syntax checks, native hooks,
Python runtime fixtures and supported development checks. Adopt verified paired
Spec Kit workflow/tooling pins; review, scan, merge and verify the exact main SHA.
