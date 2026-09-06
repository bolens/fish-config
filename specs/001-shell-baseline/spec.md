# Feature specification: Fish startup and maintained shell configuration

**Created**: 2026-09-05
**Status**: Retrospective baseline
**Inspected revision**: `6ce49edf8d530bc5702e2649c23962ff11318075`
**Input**: The owner requested a fleet-wide Spec Kit retrofit and implementation audit.

This repository distributes Fish configuration, integrations, functions, and vendored Fisher assets. Its delivery artifact is source configuration, not a modified running shell.

This specification records existing contracts after implementation. It does not
claim that the original work followed Spec Kit. New behavior requires a separate
change contract. Existing feature specifications remain authoritative within their
own scope.

## User scenarios and testing

### User story 1: Start a predictable shell (P1)

A user sources the maintained configuration in an isolated home.

**Acceptance**: Startup preserves ordered, deduplicated paths and configured editor/locale defaults without requiring optional tools.

### User story 2: Use optional integrations (P2)

A user selects a tool integration or an interactive abbreviation.

**Acceptance**: Missing optional tools are handled by the relevant guards; interactive shortcuts do not run in a noninteractive startup.

### User story 3: Maintain configuration without publishing machine state (P3)

A maintainer updates source configuration and its Fisher manifest.

**Acceptance**: Tracked Fish files pass syntax validation and private.fish, universal variable snapshots, and shell history stay excluded.

## Requirements

- **FR-001**: Startup MUST preserve idempotent PATH setup and mise shim precedence.
- **FR-002**: Interactive abbreviations and greeting MUST retain their interactive/tool availability boundaries.
- **FR-003**: Session defaults MUST remain in source-controlled global variables while existing Tide/Fisher bookkeeping retains its documented ownership.
- **FR-004**: Private configuration, universal-variable snapshots, and history MUST remain excluded from publication.
- **FR-005**: Maintained and vendored Fish files MUST parse before delivery.

## Success criteria

- **SC-001**: Every requirement has a named source owner and acceptance check in `coverage.md`.
- **SC-002**: The listed native checks pass for the reviewed candidate, with unavailable environments and operational checks recorded separately.
- **SC-003**: Retrofitting preserves existing interfaces and completed specifications. Any confirmed implementation gap is corrected under an explicit requirement before it is marked complete.

## Edge cases and operational limits

Configuration is not installed or sourced into the live user session during this retrofit. Privileged maintenance functions are inspected as source, not executed. Syntax checks do not prove optional external tools, every completion, or host integrations at runtime. No Fisher update is required for unchanged vendored assets.

## Corrective capability extension: 2026-09-06

The detailed audit starts at `3bc6cc8` after the development-environment feature.
Existing source behavior is recorded separately in legacy-contracts.md.

- **FR-006**: Optional navi initialization MUST preserve ghq's existing Ctrl+G
  binding while installing Alt+N in applicable key maps; repeated sourcing must
  not remove another integration's binding.
- **FR-007**: Cache clearing MUST preserve the cache command's failure status and
  print success only after successful clearing. Package cleanup MUST distinguish
  no orphan results from a failed query and must not invoke removal after failure.
- **FR-008**: Pacman lock recovery MUST refuse removal after an active-owner
  result, unavailable owner probe, or owner-probe diagnostics. A silent nonzero
  status alone is not proof that the lock is stale.
- **FR-009**: The yazi directory wrapper MUST preserve a failed child status,
  clean up only its owned temporary file, and avoid changing directory on failure.
- **FR-010**: Runtime acceptance MUST use isolated Fish processes and synthetic
  external-command seams. Native checks must include these regressions without
  installing configuration, clearing caches, changing packages, or touching the
  real pacman lock.
- **FR-011**: Completion files MUST contain executable Fish definitions rather
  than generator errors, terminal help, placeholders, or empty files that suppress
  bundled fallback. Retain deliberate inactive configuration stubs. Restore
  fallback for standard bundled completions and provide complete supported uv and
  Poetry generation, with isolated queries proving real command suggestions and
  no target command execution merely from loading static definitions.
- **FR-012**: Tide startup cleanup MUST preserve all existing per-process prompt
  variables if the live-Fish PID query fails or returns no usable process list;
  unavailable evidence must not erase another shell's transport state.
