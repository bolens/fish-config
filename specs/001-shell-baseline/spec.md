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
