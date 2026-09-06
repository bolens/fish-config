# Completion ownership

Keep these files as Fish definitions. Never redirect an unsupported generator's
error/help output into a `.fish` file or replace generated content with a
placeholder. Empty files shadow Fish's packaged/embedded completions; remove
unintended empty shadows instead of committing them.

The 2026-09-06 repair regenerated these complete static artifacts:

| File | Generator version | Command |
| --- | --- | --- |
| uv.fish | uv 0.12.10 | `uv generate-shell-completion fish` |
| poetry.fish | Poetry 2.4.3 | `poetry --no-plugins --no-ansi completions fish` |
| btop.fish | Installed btop help interface | Maintained definitions from `btop --help`; `--completion` is unsupported |

Capture output to a temporary file, require generator success, check it with
`fish --no-execute`, and query representative completions in an isolated HOME/XDG
before replacing the artifact. Include the reviewed generated file with the
change; loading the static uv/Poetry/btop definitions must not launch their tool.

Cargo, exa, Git, lazygit, pip, pipx, rg, rustc and Yarn use Fish's packaged or
embedded fallback. The repository no longer masks those with empty or broken
files. Availability and supported options remain tied to the installed Fish/tool
version. Deliberate `.disabled` fnm files stay inactive.

Other committed definitions retain their source interfaces: gh/Docker dynamic
completion, Just's Fish generation, and mise's usage-cli cache run only when that
completion is requested. They can inspect tool-specific local state. Do not treat
completion testing as authority to run Docker, publish content, install plugins
or use private host configuration.
