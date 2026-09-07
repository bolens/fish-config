# Requirement coverage

| Requirement | Source and acceptance evidence |
| --- | --- |
| FR-001 | `config.fish`, `conf.d/env-fixes.fish`, `conf.d/pnpm.fish`, and `conf.d/zz-mise.fish`; isolated repeated-source PATH smoke. |
| FR-002 | `config.fish`; noninteractive startup smoke and source inspection of the fastfetch guard. |
| FR-003 | `conf.d/00-options.fish`, `conf.d/00-tide-state.fish`, `fish_plugins`, and README maintenance contract. |
| FR-004 | `.gitignore`, `conf.d/keychain.fish`; `git check-ignore` and tracked-file inspection. |
| FR-005 | `.githooks/pre-push` applies `fish --no-execute` individually to every Fish file. |

## Verification receipt

On 2026-09-05: Native pre-push checks passed. An isolated `fish --no-config` smoke sourced the inspected startup files twice and verified stable PATH ordering, mise shim precedence, locale/editor defaults, and absence of interactive abbreviations. Ignore checks passed for private.fish, fish_variables snapshots, and history. A separate self-review compared these boundaries with the source and confirmed this patch adds only retrospective documentation. Hosted checks and merge evidence are recorded in the delivery PR.

## Detailed capability extension: 2026-09-06

[Legacy contracts](legacy-contracts.md) map LC-001 startup/private state, LC-002
every integration, LC-003 public navigation wrappers, LC-004 explicit maintenance,
LC-005 vendored interactive behavior and LC-006 completions/delivery. The
[baseline/current file inventory](legacy-files.md) supplies exact source ownership without
rewriting the original audit's evidence. FR-006–010 use the isolated regressions
in [test_shell_contracts.py](../../tests/test_shell_contracts.py); hosted and live
behavior remain separate evidence.
