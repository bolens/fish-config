# Documentation

Fish startup, optional integrations, and private configuration.

## Start here

| Need | Owning document |
| --- | --- |
| Use the project | [README.md](../README.md) |
| Change the repository | [AGENTS.md](../AGENTS.md) |
| Deliver or recover | [RELEASING.md](../RELEASING.md) |
| Plan substantial changes | [.specify/memory/project-guide.md](../.specify/memory/project-guide.md) |
| Non-negotiable constraints | [.specify/memory/constitution.md](../.specify/memory/constitution.md) |

## Architecture

[config.fish](../config.fish) and [startup snippets](../conf.d) control initialization. Autoloaded
functions and completions should remain usable without forcing optional tools into every shell
startup. Preserve interactive versus non-interactive behavior, repeated loading, and missing-tool
fallback. The [README](../README.md) owns user setup.

## Deployment and recovery

[RELEASING.md](../RELEASING.md) separates source delivery from replacing a live shell configuration.
Validate syntax first and exercise affected startup behavior in isolated HOME/XDG roots. Keep the
previous configuration available before an authorized installation.

## Database and state

There is no repository-owned database. Private values, universal variables, history, and installed
plugin state belong to the user environment. [Plugin declarations](../fish_plugins) record
dependencies without making a developer shell a reproducible test fixture.

## Documentation maintenance

Keep decisions, invariants, failure modes, and recovery requirements in the owning document. Link to
commands, defaults, schemas, and generated catalogs instead of copying them. Change the owner and
affected references together. Update this index when adding or moving a guide, and verify relative
links and heading anchors. Historical specs and audits describe their recorded revision, not current
runtime proof. A topic without an implementation stays explicitly unimplemented.

## Topic guides

- [Development environments](development-environments.md)
