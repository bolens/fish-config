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
