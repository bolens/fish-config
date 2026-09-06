# Third-party notices

## License scope

The root MIT license covers original material authored by bolens. It does not
replace third-party licenses, copyright notices, trademarks, or service terms.
Imported and modified third-party material keeps its applicable upstream terms.

## Captured Fish configuration

Copied plugin functions, completions, and initialization files are excluded from
the root MIT grant and retain the terms below. Installed command-line programs
are separate dependencies. Generated completions keep their generator's and
source project's applicable terms.

The original import revisions were not recorded. The URLs below pin the license
copies retrieved during the 2026-09-06 audit, not verified import revisions.
CachyOS-derived aliases and generated completions still need exact provenance.
Do not infer MIT coverage for them from the repository's root license.

## GitHub Spec Kit

Imported `.specify/scripts/`, `.specify/templates/`, and
`.agents/skills/speckit-*` integration files retain GitHub's MIT copyright and
permission notice in [.specify/LICENSE](.specify/LICENSE). Include it when
copying these files. Project-authored memory documents have separate ownership.

## Retained upstream license copies

These source URLs identify the retrieved license text. They do not establish
the exact revision of older unrecorded imports. File-level notices take
precedence over a project-wide license.

- **tide**: `functions/_tide_*`, `functions/tide*`, `functions/fish_prompt.fish`, `functions/fish_mode_prompt.fish`, `conf.d/*tide*`, `completions/tide.fish`. [Upstream license](https://github.com/IlanCosman/tide/blob/c4e3831dc4392979478d3d7b66a68f0274996c85/LICENSE.md). Full copy: [LICENSES/tide.txt](LICENSES/tide.txt).
- **fzf-fish**: `functions/__fzf*`, `conf.d/fzf.fish`. [Upstream license](https://github.com/jethrokuan/fzf/blob/479fa67d7439b23095e01b64987ae79a91a4e283/LICENSE.md). Full copy: [LICENSES/fzf-fish.txt](LICENSES/fzf-fish.txt).
- **pisces**: `functions/_pisces_*`, `conf.d/pisces.fish`. [Upstream license](https://github.com/laughedelic/pisces/blob/e45e0869855d089ba1e628b6248434b2dfa709c4/LICENSE.md). Full copy: [LICENSES/pisces.txt](LICENSES/pisces.txt).
- **fish-ghq**: `functions/__ghq_repository_search.fish`, `conf.d/ghq_key_bindings.fish`, `completions/ghq.fish`. [Upstream license](https://github.com/decors/fish-ghq/blob/cafaaabe63c124bf0714f89ec715cfe9ece87fa2/LICENSE). Full copy: [LICENSES/fish-ghq.txt](LICENSES/fish-ghq.txt).
- **fish-done**: `conf.d/done.fish`. [Upstream license](https://github.com/franciscolourenco/done/blob/b86292a52a2b8f646ef8d25daa3cc01ccab60b62/LICENSE). Full copy: [LICENSES/fish-done.txt](LICENSES/fish-done.txt).
- **fish-pure**: `conf.d/_pure_init.fish`, `conf.d/pure.fish`. [Upstream license](https://github.com/pure-fish/pure/blob/8c08b26425f17e9d25a95a70c43ef632156250ea/LICENSE). Full copy: [LICENSES/fish-pure.txt](LICENSES/fish-pure.txt).
- **fish-autopair**: `conf.d/autopair.fish`. [Upstream license](https://github.com/jorgebucaran/autopair.fish/blob/4d1752ff5b39819ab58d7337c69220342e9de0e2/LICENSE.md). Full copy: [LICENSES/fish-autopair.txt](LICENSES/fish-autopair.txt).

Pisces uses LGPLv3, which incorporates GPLv3. Both license texts are retained
in `LICENSES/pisces.txt` and `LICENSES/GPL-3.0.txt`. Its covered source remains
available in this repository. Keep it modifiable under those terms.

## Redistribution

Keep applicable full license and copyright notices with copied source and
bundled dependencies, including minified JavaScript and compiled executables.
Use the exact dependency versions selected by the lockfile or build. Preserve
Apache NOTICE material and satisfy copyleft source requirements where they
apply. Development-only tools and separately installed programs keep their own
terms but are not automatically part of a distributed application.

This source inventory is not proof that every historical release, external
asset, fetched dataset, or built container has satisfied its license obligations.
