# Retrofit tasks

- [x] T001 Read repository guidance and identify source ownership.
- [x] T002 Record the retrospective requirements and acceptance mapping.
- [x] T003 Run the native checks and reconcile requirement gaps in `coverage.md`.
- [x] T004 Separately review the complete candidate against its requirements.

Hosted checks and merge evidence belong to the delivery PR. Follow RELEASING.md.

## Capability extension: 2026-09-06

- [x] T006 Map startup modules, all public command wrappers, vendored plugin functions/completions and supporting maintenance ownership in legacy-contracts.md.
- [x] T007 Reproduce missing key-binding ownership and failed cache/query/lock-probe/yazi behavior in disposable Fish fixtures (FR-006–010).
- [x] T008 Correct the demonstrated failures and integrate runtime acceptance into native validation.
- [x] T009 Verify isolated interactive/noninteractive repeated loading, source/spec links, all Fish syntax and native checks.
- [ ] T010 Adopt paired shared Spec Kit pins, review and scan the candidate, then record protected-branch delivery evidence.

No actual package manager, lock removal, cache clear, plugin installation, graphical
session or live shell configuration is exercised by these fixtures.

- [x] T011 Replace invalid btop completion help/error output with maintained Fish definitions, verified against the installed command's --help and isolated completion queries (FR-005).

- [x] T012 Remove unintended empty/broken completion shadows and replace uv/Poetry placeholders through supported generators; verify representative real completion queries and preserve explicit inactive fnm records (FR-011).

Local evidence: eleven isolated runtime tests pass, including missing-tool repeated
interactive/noninteractive startup, navi/ghq binding retention, child failure/status,
empty queries, active/failed/unused lock probes, owned yazi temporary cleanup and
real completion suggestions. The lock fixture changes only a copied function's
constant pathname and replaces sudo/fuser; it never queries the live lock.
The first attempted lock fixture used an invalid Fish keyword override; that
fixture was corrected before confirming the original removal bug and implementing
the guard. Other four initial regression failures were reproduced directly.
uv/Poetry were generated with installed supported interfaces, syntax-checked before
replacement, and exercised with stubs that would expose unexpected tool execution.

- [x] T013 Reproduce failed PID discovery erasing Tide transport state, then require a successful nonempty PID observation before cleanup (FR-012).

The PID-query regression first required correcting its fixture: current Fish
--no-config promotes universal writes to globals. A copied snippet substitutes
only that storage scope, retaining its real query/cleanup control flow. The
corrected fixture failed by deleting all six prompt variables, then passed after
the guard. This verifies failure preservation without touching actual universal
state or claiming live concurrent-shell evidence. Twelve runtime tests now pass.

The final native development check passed: all maintained Fish files parse, twelve
shell fixtures and five development-adapter fixtures pass, Markdown/ruff checks
pass, and actionlint/offline zizmor report no actionable findings. The current
file map covers 194 sources including completion maintenance documentation; all
231 local feature destinations resolve. No live installation was performed.

The publication scan found a frozen host home/UID/multishell path in the inactive
fnm example. Replace it with HOME-derived setup and explicit current-process
generation while retaining its .disabled suffix (FR-004). The remaining upstream
Python prompt path is a documented illustrative example, not owner state.

CI follow-up: both Nix development environments exposed an unset-CCACHE_DIR
prompt expansion defect hidden by the host environment. The isolated fixture now
removes that inherited variable. Quoting the complete prompt retains the read
destination; eight confirmation cases cover unset/custom directories and y/Y/n/empty
answers. Local regression execution and hosted delivery are recorded in the PR.
