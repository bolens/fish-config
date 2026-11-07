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
   source lint, and any checks not covered by this pipeline.

Local validation is evidence for the source; it does not establish native
runner success. Failure leaves existing GitHub validation available. Recover
through a corrective PR, without changing live workstation configuration.

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
literal filenames. Only after actual native PR and merged-main success may the
duplicate hosted Source lint requirement move to
`ci/woodpecker/pr/woodpecker`. Preserve macOS, Docker/editor and forge automation.

## CI discovery index

| Group | Local command | Current native owner |
| --- | --- | --- |
| `validation` | `devenv test` (`scripts/check-development.sh` is the canonical check sequence) | `woodpecker` / `development-environment` |
| `source-markdown` | `python3 scripts/check-markdown.py` (`--list` prints the selection) | Included in `validation` |
| `workflow-security` | `actionlint` and `zizmor --offline --min-severity medium --min-confidence medium .github` | Included in `validation` |
| `regression` | `python3 -m unittest discover -s tests -p test_markdown.py -v` | Included in `validation` |

The existing native PR context is `ci/woodpecker/pr/woodpecker`. Keep that name
until a coordinated fleet change updates pipeline names, required checks and
documentation together. A future `validation` pipeline name must preserve the
same canonical command and check coverage. This change does not rename it.

The hosted development workflow still owns macOS and any actual Docker/editor
checks selected there. Forge assignment, labels and Spec Kit update automation
remain separate from these portable validation groups. Require genuine native
PR and merged-main results before disabling a proven duplicate workflow.
