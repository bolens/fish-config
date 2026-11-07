# Woodpecker validation transition

The native pipeline runs the existing locked `devenv test` in a disposable
Linux container on the shared CI site. It does not apply configuration to a
workstation. The clone and runtime images are immutable; there are no host
mounts, Docker sockets, privileged containers, or publishing secrets.

## Delivery plan

1. Add the native pipeline and activate this repository with fork approval.
2. Require the existing GitHub checks and the actual native PR result before
   squash merging the reviewed source.
3. Verify the genuine main pipeline and its exact source revision.
4. Move duplicate Linux validation after native proof and required-check
   settings agree. Preserve macOS, actual Docker, administrative automation,
   managed security, and any checks not covered by this pipeline.

Local validation is evidence for the source; it does not establish native
runner success. Recover through a corrective PR without changing live
workstation configuration.
If native validation is unavailable, re-enable the reviewed hosted fallback and
verify its current-head result before migrating protection.

Review image pins monthly and after security releases against the official
registries. Existing dependency automation does not discover these Woodpecker
YAML image references; updates require a reviewed PR and native execution.

## Maintained Markdown coverage

The native development check now selects tracked Markdown through
`.github/source-lint.json`, using the shared selector's matching and exclusion
rules. This includes hidden editor documentation and every selected specification,
while managed `.agents` and `.specify` content keeps its separate validation.
The existing correctness rules in `.markdownlint.json` remain unchanged.

Run `python3 scripts/check-markdown.py --list` to inspect the exact selection,
then `devenv test` for the full native gate. A malformed link in hidden editor
documentation must fail the same check; tests exercise the real linter and
literal filenames. The duplicate hosted Source lint workflow and requirement
are retired following native PR/main acceptance. Keep
`ci/woodpecker/pr/woodpecker` required, alongside the retained hosted platform
and forge checks.

## CI discovery index

Use the [shared CI vocabulary](https://github.com/bolens/.github/blob/main/docs/woodpecker-transition.md#ci-organization):
`validate`, `test`, `site` and `publish` identify purpose, with descriptive
subgroups. These labels preserve existing workflow and protected-status names.

| Phase / group | Local command | Current native owner |
| --- | --- | --- |
| `validate` / development | `devenv test` (`scripts/check-development.sh` is the canonical check sequence) | `woodpecker` / `development-environment` |
| `validate` / Markdown | `python3 scripts/check-markdown.py` (`--list` prints the selection) | Included in `development-environment` |
| `validate` / workflow security | `actionlint` and `zizmor --offline --min-severity medium --min-confidence medium .github` | Included in `development-environment` |
| `test` / fixture regressions | `python3 -m unittest discover -s tests -p test_markdown.py -v` | Included in `development-environment` |

The existing native PR context is `ci/woodpecker/pr/woodpecker`. Keep that name
until a coordinated fleet change updates pipeline names, required checks and
documentation together. Purpose labels describe coverage; the existing
canonical command and pipeline name remain unchanged.

The hosted development workflow still owns macOS and any actual Docker/editor
checks selected there. Forge assignment, labels and Spec Kit update automation
remain separate from these portable validation groups. The duplicate hosted
CI, Workflow lint and Source lint workflow is retired. Require fresh native PR/main
proof and coordinated settings before retiring any additional producer.
