# fish-config

Personal Fish shell configuration for Arch Linux. Managed with [Fisher](https://github.com/jorgebucaran/fisher) and the [Tide](https://github.com/IlanCosman/tide) prompt.

This machine runs Omarchy on CachyOS. User configuration takes precedence over
CachyOS vendor snippets without modifying package-owned files under
`/usr/share/fish`; Omarchy continues to own the Hyprland/UWSM session.

## Structure

```
.
├── config.fish          # Top-level config (greeting, PATH, editor, locale)
├── fish_plugins         # Fisher plugin manifest
├── conf.d/              # Auto-sourced config modules
├── functions/           # Custom functions and wrappers
├── completions/         # Tab completion scripts
└── .gitignore           # Excludes fish_variables, fish_history, private config
```

## Plugins

| Plugin | Purpose |
|---|---|
| [ilancosman/tide](https://github.com/IlanCosman/tide) | Prompt |
| [jethrokuan/fzf](https://github.com/jethrokuan/fzf) | fzf key bindings |
| [laughedelic/pisces](https://github.com/laughedelic/pisces) | Auto-close brackets/quotes |
| [decors/fish-ghq](https://github.com/decors/fish-ghq) | ghq repo navigation (Ctrl+G) |

Common Git abbreviations are maintained locally in `conf.d/git-abbr.fish`.
The curated set intentionally omits shortcuts for destructive reset and clean
operations.

Long-command notifications are implemented locally for Omarchy's Hyprland
session and `notify-send`; no focus probe runs during shell startup.

## Modern CLI tool integrations

The config keeps standard command names compatible and provides explicit
shortcuts for modern alternatives:

| Shortcut | Tool |
|---|---|
| `f` | [fd](https://github.com/sharkdp/fd) |
| `rgi` | [ripgrep](https://github.com/BurntSushi/ripgrep) with hidden files and PCRE2 |
| `http` | [curlie](https://github.com/rs/curlie) |
| `dns` | [dog](https://github.com/ogham/dog) |
| `repeat` | [viddy](https://github.com/sachaos/viddy) |
| `diskfree` / `diskuse` | [duf](https://github.com/muesli/duf) / [dust](https://github.com/bootandy/dust) |
| `monitor` | [btop](https://github.com/aristocratos/btop) |
| `ls` / `ll` / `la` / `lt` | [eza](https://github.com/eza-community/eza) |
| `gdv` | [delta](https://github.com/dandavison/delta) diff viewer |
| `lg` | — | [lazygit](https://github.com/jesseduffield/lazygit) |
| `ld` | — | [lazydocker](https://github.com/jesseduffield/lazydocker) |
| `yy` | — | [yazi](https://github.com/sxyazi/yazi) (cd on exit) |

Other integrations: [fzf](https://github.com/junegunn/fzf), [zoxide](https://github.com/ajeetdsouza/zoxide), [mise](https://github.com/jdx/mise), [navi](https://github.com/denisidoro/navi) (Alt+N), [delta](https://github.com/dandavison/delta) as git pager, [bat](https://github.com/sharkdp/bat) as MANPAGER.

Mise uses shim-based activation to keep `PATH` compact while retaining
per-project runtime selection. Environment-changing mise features that require
shell hooks should be invoked explicitly with `mise x` or `mise env`.

Session defaults and paths are global variables loaded from `conf.d`.
Universal variables are reserved for Tide's asynchronous prompt transport and
Fisher bookkeeping, reducing cross-shell writes and interrupted snapshots.

The empty `conf.d/pure.fish`, `conf.d/_pure_init.fish`, and
`conf.d/autopair.fish` files intentionally shadow CachyOS vendor integrations:
Tide replaces Pure, and Pisces replaces autopair. Keep these stubs while
`cachyos-fish-config` depends on `fish-pure-prompt`.

## Maintenance

Fisher-managed functions and completions are committed intentionally so a
fresh clone works offline. Treat `fish_plugins` as the source-of-truth manifest;
after changing it, run `fisher update` and commit the resulting generated-file
changes together. Machine state (`fish_variables*`, history, and
`conf.d/private.fish`) remains ignored.

## Private config

Machine-specific secrets and personal values (SSH key names, API tokens) live in
`conf.d/private.fish`, which is excluded from git via `.gitignore`. Create it locally:

```fish
# conf.d/private.fish — not tracked in git

set -gx MY_API_TOKEN "..."

if status is-interactive
    keychain --eval --quiet your-key-name | source
end
```
