# Legacy shell capability contracts

Retrospective extension dated 2026-09-06, inspected at `3bc6cc8`. This records
existing behavior alongside the corrective FR-006–010 requirements. Delivery is
source configuration, not installation into a running shell. The
[file map](legacy-files.md) accounts for the original 202 files and corrected 193 Fish/disabled artifacts plus completion maintenance documentation under conf.d,
functions and completions; config.fish and supporting tooling are mapped here.

## LC-001: Startup, private state and command discovery

[config.fish](../../config.fish) defines the top-level greeting, prepends an existing
Go bin directory and appends existing local/Pixi paths idempotently, configures
vcpkg/Nix defaults, normalizes LANG and clears inherited locale overrides, selects
micro/code-wait editors, points ripgrep at the user's config, and optionally
sources the user's readable opam initialization. Greeting invokes fastfetch only
for a top-level shell when it is present. Fish's greeting lifecycle is interactive;
sourcing the file alone must not run fastfetch.

Interactive abbreviations expand explicit commands without replacing their binaries:
y/ytdl/f/rgi/diskfree/diskuse/http/dns/monitor/repeat, get_idf and nvrun. Git
abbreviations cover add/commit/branch/diff/fetch/pull/log/merge/push/rebase/revert/
restore/show/status/stash/switch/worktree. They are editable expansions, including
explicit amend and force-with-lease forms, not automatic execution. The curated
set excludes reset/clean shortcuts. Repeated sourcing must preserve one current
abbreviation definition and leave noninteractive sessions without these additions.

[.gitignore](../../.gitignore) excludes private.fish, history, universal-variable
state and development outputs. Private key names, agents and tokens are not
configuration defaults. No tracked initializer starts Keychain; the keychain
snippet is a placeholder for the ignored private integration.

Acceptance: isolated repeated startup preserves PATH precedence/defaults, optional
commands do not run merely to generate static setup, no interactive abbreviations
appear in noninteractive loading, and private state remains ignored. Syntax alone
does not measure startup latency or prove a real desktop session.

## LC-002: Every startup integration

| Source module | Observable contract |
| --- | --- |
| [00-options](../../conf.d/00-options.fish) | Global fzf height/options/key-binding/preview defaults and Pisces pairs are set before vendored snippets to avoid avoidable universal initialization. |
| [00-tide-state](../../conf.d/00-tide-state.fish) | Interactive-only cleanup considers orphaned per-process prompt variables after more than five accumulated entries, using current Fish PIDs when pgrep exists. Failed/empty discovery preserves all transport variables (FR-012). No process is killed by this snippet. |
| [_tide_init](../../conf.d/_tide_init.fish) | Register install/update/uninstall event handlers for Tide configuration, warnings and cleanup. Registration is distinct from explicitly firing installation events. |
| [tide](../../conf.d/tide.fish) | Global maintained colors/icons, left/right item selections, frames/separators, transient prompt and thresholds feed the prompt engine. Source data remains the configured default, rather than a machine snapshot. |
| [_pure_init](../../conf.d/_pure_init.fish), [pure](../../conf.d/pure.fish), [autopair](../../conf.d/autopair.fish) | Intentionally empty user snippets shadow conflicting vendor integrations. Their emptiness is implemented behavior, not missing functionality. |
| [ccache](../../conf.d/ccache.fish) | Initialize optional cache location/size/compression only when installed. ccache-cmake-clang sets process-local compiler/launcher variables for its supplied command; no global hardlink/sloppiness policy or cache clear at startup. |
| [done](../../conf.d/done.fish) | Register notifications only in interactive Hyprland with hyprctl and notify-send. Probe focus at command events, not startup; notify after >5 seconds only when focus changed, excluding ordinary Git commands except push/pull/fetch. Preserve exit status in success/failure title and urgency. |
| [env-fixes](../../conf.d/env-fixes.fish) | Clear inherited LD_LIBRARY_PATH/QML2_IMPORT_PATH, deduplicate PATH in first-match order, normalize already-present Meshroom path variables. Do not alter global host configuration. |
| [fzf](../../conf.d/fzf.fish) | Interactive key maps select vendored file/history/directory/open helpers and optionally completion. Preserve configured defaults; uninstall removes its own registered bindings/settings. |
| [ghq_key_bindings](../../conf.d/ghq_key_bindings.fish) | Own Ctrl+G for repository search in default and available insert maps. |
| [git-abbr](../../conf.d/git-abbr.fish) | Install the curated global Git abbreviation set only for interactive shells. |
| [gpg](../../conf.d/gpg.fish) | Set GPG_TTY from the current interactive terminal; SSH agent ownership remains private. |
| [keychain](../../conf.d/keychain.fish) | Document private agent ownership without launching a process or naming keys. |
| [navi](../../conf.d/navi.fish) | When available interactively, Alt+N tries a best match for current process text then an interactive candidate. Replace only with a nonempty candidate. Repeated setup retains ghq's Ctrl+G (FR-006). |
| [pager](../../conf.d/pager.fish) | Configure the declared col/bat man-page pipeline and MANROFFOPT; these are tool-dependent pager defaults, not a guarantee that either binary is installed. |
| [pisces](../../conf.d/pisces.fish) | Install default/insert pairing, backspace and variable-aware completion bindings from configured pairs; uninstall restores baseline editing actions. |
| [pnpm](../../conf.d/pnpm.fish) | Set PNPM_HOME and add its bin directory when the configured home exists, without duplicates. |
| [python](../../conf.d/python.fish) | Disable virtualenv's own prompt decoration so Tide owns prompt rendering. |
| [rust](../../conf.d/rust.fish), [rustup](../../conf.d/rustup.fish) | Clear global RUSTFLAGS and source existing Cargo environment; optimization/CPU policy stays project-local. |
| [vite-plus](../../conf.d/vite-plus.fish) | Append Vite+ bin below selected runtimes without executing vp for setup. Wrapper forwards ordinary calls; successful `env use` (including supported -C forms) evaluates emitted Fish commands with explicit shell/eval env. Failed calls or help requests do not evaluate output. Dynamic completion runs only when requested. |
| [zoxide](../../conf.d/zoxide.fish) | Set local data directory; evaluate successful generated Fish initialization only when installed and interactive. |
| [zz-mise](../../conf.d/zz-mise.fish) | Move existing mise shims to precedence after other snippets without launching mise at every startup; hook-dependent environment features remain explicit. |
| [fnm disabled](../../conf.d/fnm.fish.disabled) | Retained inactive material; the .disabled suffix prevents Fish's normal snippet loading. |

## LC-003: Navigation, files and terminal wrappers

Unless listed otherwise, wrappers forward the original argument list to the named
external program and expose its result. Missing tools may fail on explicit use;
these wrappers do not execute during startup. Deliberate command replacements
(e.g. ls/egrep/fgrep/nano/htop/help) have the explicitly documented alternate
program's option semantics, not complete compatibility with the original binary.

| Function | Contract |
| --- | --- |
| `..`, `...`, `....`, `.....`, `......` | Change one through five parent directories using the corresponding dot-named autoload files. Extra arguments retain Fish cd semantics. |
| `ls`, `ll`, `la`, `lt` | eza normal/long/all/tree listings with configured color, directory grouping and icons; ll adds Git metadata. |
| `l.` | List all entries through eza and filter leading-dot names. This textual listing is not a lossless filename transport. |
| `vdir` | Invoke the external vdir explicitly with automatic color, avoiding recursion. |
| `egrep`, `fgrep` | Invoke rg with color; fgrep adds fixed-string matching. |
| `copy`, `paste` | Copy stdin or supplied file contents to Wayland clipboard; paste forwards wl-paste output/options. These act on clipboard state only when invoked. |
| `tarnow`, `untar` | Forward tar archive creation with auto compression or verbose extraction. Inputs/output and overwrite behavior are tar's; no preservation workflow is implied. |
| `yy` | Start yazi with an owned cwd file in runtime dir or /tmp; on successful exit read a nonempty changed directory, then clean its own file. Failed yazi retains the original directory/status and still cleans its file (FR-009). |
| `lg`, `ld` | Explicit lazygit/lazydocker shorthands; invocation can open interactive tools. No Docker call is required by shell startup or this audit. |
| `help`, `htop`, `hx`, `nano` | Explicit tldr, btop, helix and micro replacements. |
| `hyprflow` | Serialize the external /usr/bin/hyprflow invocation using a runtime-directory flock with a 30-second wait. It is a session-changing explicit command, not startup work. |
| `tb` | Forward stdin/arguments to netcat at termbin.com:9999. This uploads content when invoked; no upload is exercised or authorized merely by auditing its source. |

Acceptance covers argument preservation and representative failed children in
isolated fixtures. Clipboard/desktop/file-manager UIs and external uploads are
separate execution boundaries, not inferred from parsing a wrapper.

## LC-004: Explicit system and package maintenance

| Function | Contract and limits |
| --- | --- |
| `ccache-stats`, `ccache-clear` | Guard optional tool availability; display statistics or ask y/Y before clearing, including when CCACHE_DIR is unset or contains spaces. A failed clear cannot print success and retains child status (FR-007). |
| `cleanup` | Query orphan package names; genuine empty results report no action. Failed/diagnostic/partial queries cannot trigger sudo removal (FR-007). A successful nonempty query forwards exact package names to pacman -Rns. |
| `fixpacman` | Return without action for an absent lock. Require available owner-probe tools, refuse an active owner, abnormal status or diagnostic output, and only remove a candidate unused lock after the checked probe (FR-008). This is not a general transaction/recovery or namespace-isolation proof. |
| `update` | Prefer paru -Syu, otherwise sudo pacman -Syu, forwarding caller arguments. No update runs at shell startup. |
| `pbuild` | Invoke paru with process-local system-only PATH to avoid project runtime shims during package builds. |
| `grubup`, `mirror`, `please` | Explicit sudo grub-mkconfig output to the standard GRUB path, CachyOS mirror rating, or sudo forwarding. These are operational commands requiring their own invocation authority. |
| `big`, `rip`, `gitpkg` | Report sorted package sizes, recent installation entries (last 200), or installed -git package count. Pipeline output is diagnostic text; it is not proof every upstream query succeeded. |
| `cpudetails`, `cpuinfo`, `diskdetails`, `gpuinfo`, `hw`, `pcinfo` | Forward lscpu, cpufetch, diskonaut, nvtop, inxi -S or inxi -Fxxxz respectively. |
| `jctl`, `psmem`, `psmem10` | Show priority-3 boot journal or processes sorted by memory, optionally first ten lines. Diagnostic reports can contain host-private details. |

The [fuser manual](https://man.archlinux.org/man/fuser.1.en) documents nonzero for
both no users and fatal errors. The corrected wrapper retains diagnostics instead
of treating every failed silent probe as evidence of a stale lock. Fixtures
substitute the lock pathname in a copied function and stub sudo/fuser; the real
package database lock is never read or changed.

## LC-005: Vendored prompt and interactive editing

The four [Fisher manifest](../../fish_plugins) entries are Tide v6, jethrokuan/fzf,
laughedelic/pisces and decors/fish-ghq. Committed implementation supports offline
loading; mutable plugin references are not claims of an audited immutable upstream
import. No Fisher update is needed or run for unchanged vendored source.

Tide supplies one/two-line left/right prompts, working-directory shortening,
status/pipeline/jobs/duration/context and optional tool segments, colors/frames,
transient prompts and per-process asynchronous transport. Unavailable optional
segments are removed from active item lists. Repaint must not start a second
unnecessary background worker; normal exit erases its prompt variable. Local
fish_title is self-contained and avoids absent Pure variables; fish_mode_prompt
intentionally suppresses the vendor hook.

`tide --help/--version`, `configure`, `reload` and `bug-report` are separate public
interfaces. Configure has terminal size bounds, explicit choices/restart/quit and
automatic-choice validation; finishing can overwrite Tide's universal settings.
Reload re-sources the prompt. Bug-report may inspect versions over the network,
print prompt variables, ask for environment details or explicitly launch a clean
Fisher installation. These are invoked operations, not offline/static guarantees.
Wizard choices/configuration presets and fake preview functions have one owner in
the file map; they do not become separate undisclosed installed plugins.

fzf helpers implement file/directory discovery, history search, editor/open
selection, token parsing, preview and completion; cancellation must not invent a
selection. ghq lists repository paths through a supported available selector and
changes directory only on a selection. Pisces helpers implement pair lookup,
insert/skip/backspace/removal/jump and variable completion using Fish commandline
state; they should preserve unpaired text and restore baseline bindings on
uninstall. Detailed GUI/PTY interactions and every external selector remain
separate from this pass's syntax and targeted key-binding fixtures.

## LC-006: Completion inventory and supporting delivery

The baseline contained 24 completion files. Seven empty shadows (cargo, exa, git,
lazygit, pipx, rg, rustc), invalid pip registration and failed Yarn output are
retired to Fish's packaged/embedded fallback. The corrected tree has 15 completion
files: bat, btop, copilot, docker, inactive fnm, fd, fzf, gh, ghq, just, mise,
poetry, rustup, tide and uv.

The btop file previously contained an unsupported --completion error and terminal
help. Its replacement registers the verified --help interface without running
btop during loading. uv 0.12.10 and Poetry 2.4.3 generated complete static definitions
through their supported Fish interfaces, replacing placeholders. The generated
function/option/subcommand declarations remain source-controlled; do not manually
trim them to examples. [Completion maintenance](../../completions/README.md) records
generation and fallback ownership. Isolated queries prove git/cargo version flags,
uv sync and Poetry install suggestions; uv/Poetry stubs prove these static queries
do not invoke either tool.

Dynamic gh/Docker completion helpers call their associated program only when
completion is requested. Just sources its successful generated Fish response;
mise requires usage-cli and caches a version-named spec in XDG cache or the private
home, publishing a complete temporary file by rename. Tool-dependent completion
is not startup and does not prove every installed tool version compatible.
Inactive fnm cannot shadow active definitions. No completion query in this audit
runs Docker, installs plugins or modifies the live shell.

Native hooks validate each Fish source individually; the push gate also runs
isolated runtime regressions. Source lint includes maintained Python and specs.
The original [002 development-environment contract](../002-development-environments/spec.md)
owns devenv/container preparation and adapters. Source-free images, current user
mount semantics, and unavailable host engines remain distinct from live shell
installation. Both Spec Kit workflow and tooling refs adopt the same verified
central revision; project memory/private state retains its original ownership.

Exact PR/main checks and operational exclusions are recorded in delivery evidence.
A successful fixture verifies its command seam, not actual privileged maintenance,
all prompt visuals, all completion versions or installed desktop behavior.
