# Agent guidance

Read `.specify/memory/constitution.md` and the relevant section of `README.md`.

- Use Fish-native modular patterns. Startup must remain fast, idempotent, and
  non-fatal when optional tools are absent.
- Keep host-private values and credentials in ignored private configuration.
- Syntax-check changed Fish files; do not install or replace the live shell
  configuration unless explicitly requested.
