# fish-config

Personal Fish shell configuration for Arch Linux. Managed with [Fisher](https://github.com/jorgebucaran/fisher) and the [Tide](https://github.com/IlanCosman/tide) prompt.

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
| [jhillyerd/plugin-git](https://github.com/jhillyerd/plugin-git) | Git abbreviations |
| [jethrokuan/fzf](https://github.com/jethrokuan/fzf) | fzf key bindings |
| [franciscolourenco/done](https://github.com/franciscolourenco/done) | Notify on long commands |
| [laughedelic/pisces](https://github.com/laughedelic/pisces) | Auto-close brackets/quotes |
| [decors/fish-ghq](https://github.com/decors/fish-ghq) | ghq repo navigation (Ctrl+G) |
| [edc/bass](https://github.com/edc/bass) | Run bash scripts in fish |
| [mattmc3/fishcheck](https://github.com/mattmc3/fishcheck) | Fish configuration checks |

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
| `cat` | [bat](https://github.com/sharkdp/bat) |
| `ls` / `ll` / `la` / `lt` | [eza](https://github.com/eza-community/eza) |
| `gdv` | [delta](https://github.com/dandavison/delta) diff viewer |
| `lg` | — | [lazygit](https://github.com/jesseduffield/lazygit) |
| `ld` | — | [lazydocker](https://github.com/jesseduffield/lazydocker) |
| `yy` | — | [yazi](https://github.com/sxyazi/yazi) (cd on exit) |

Other integrations: [fzf](https://github.com/junegunn/fzf), [zoxide](https://github.com/ajeetdsouza/zoxide), [mise](https://github.com/jdx/mise), [navi](https://github.com/denisidoro/navi) (Alt+N), [delta](https://github.com/dandavison/delta) as git pager, [bat](https://github.com/sharkdp/bat) as MANPAGER.

Mise uses shim-based activation to keep `PATH` compact while retaining
per-project runtime selection. Environment-changing mise features that require
shell hooks should be invoked explicitly with `mise x` or `mise env`.

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
