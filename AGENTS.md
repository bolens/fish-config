# Agent guidance

Before Spec Kit planning or implementation, read
`.specify/memory/project-guide.md` with the project constitution. It maps
requirements to this repository's source, acceptance evidence, and validation.

Read `.specify/memory/constitution.md` and the relevant section of `README.md`.

- Use Fish-native modular patterns. Startup must remain fast, idempotent, and
  non-fatal when optional tools are absent.
- Keep host-private values and credentials in ignored private configuration.
- Syntax-check changed Fish files; do not install or replace the live shell
  configuration unless explicitly requested.

## Spec-driven changes

Use Spec Kit for new capabilities, architecture, security-sensitive behavior,
migrations, and coordinated multi-file changes. Keep narrow fixes, dependency
updates, prose edits, and release housekeeping in the normal repository
workflow unless their risk warrants a written specification. Keep completed
feature directories under `specs/` as decision history; do not backfill them for
finished work.
