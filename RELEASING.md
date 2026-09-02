# Delivery playbook

Fish Config continuously delivers source configuration from protected `main`;
it has no tagged releases. Installing it into a live shell is separate from
merging repository state.

## Prepare and validate

Branch from current `origin/main`, keep host-private values in ignored files,
and run repository hooks plus syntax checks for every changed Fish file. Test
representative interactive and non-interactive startup with an isolated HOME,
including absence of optional tools. Record startup or compatibility impact.

## Review, deliver, and verify

Require a pull request, all checks, resolved conversations, and a squash merge.
Never push directly to `main`. Verify the merge SHA in CI and inspect the final
diff for accidental private state. Do not replace the live Fish configuration
as part of this workflow.

## Recover

Correct source through another PR. For an authorized installation, retain the
previous config, start a separate Fish process first, and restore the backup if
startup, PATH, prompt, or command resolution regresses.

Fleet policy: <https://github.com/bolens/.github/blob/main/RELEASING.md>.
