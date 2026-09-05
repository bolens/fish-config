# fish-config Spec Kit project guide

Modular Fish configuration with optional integrations and private host state kept
separate.

Read this guide with `AGENTS.md` and `.specify/memory/constitution.md` before
specifying, planning, or implementing a substantial change. It is project-owned
guidance, not an upstream-managed template.

## Source and ownership map

- `config.fish`
- `conf.d/`
- `functions/`
- `completions/`
- `fish_plugins`
- `README.md`

## Specification and plan decisions

Locate startup ownership, function/autoload behavior, completions, and plugin
dependencies. Specify interactive versus non-interactive behavior, command
compatibility, lazy initialization, and missing-tool fallback. Use Fish-native syntax.

## Acceptance evidence

Cover repeated loading, a missing optional command, empty or unusual arguments, and non-
interactive output. Use disposable HOME/XDG roots for startup tests and preserve the
existing live configuration.

## Validation and operational limits

```sh
fish --no-execute config.fish
bash .githooks/pre-push
```

The push hook syntax-checks all tracked-tree Fish sources and workflow definitions.
Syntax alone does not establish startup latency or runtime behavior; select isolated
startup checks when those contracts change. Do not install plugins or replace the live
shell setup.

## Working through Spec Kit

Use Spec Kit for new capabilities, architectural or security-sensitive changes,
migrations, and coordinated changes that need a written contract. Keep narrow fixes,
dependency updates, and prose maintenance in the normal PR workflow.

For a new feature, record observable acceptance criteria in `spec.md`, source ownership
and constitution checks in `plan.md`, and evidence-bearing work in `tasks.md` under the
feature directory created by Spec Kit. Resolve material unknowns before implementation.
Mark tasks complete only after their stated verification, and distinguish completed,
skipped, blocked, and manual checks. Retain completed feature documents as decision
history; do not backfill feature specifications for already finished code.

Keep `.specify/templates/`, `.specify/scripts/`, and generated Codex skills under their
integration manifests. Use this guide and the constitution for local customization.
Regenerate managed files through Spec Kit and verify that project-owned memory survives
updates. Follow `RELEASING.md` for push, merge, release or delivery, and recovery.
