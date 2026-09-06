#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
# Syntax checks do not load this checkout as the active Fish configuration.
bash .githooks/pre-push
markdownlint-cli2 '*.md' 'docs/**/*.md' 'specs/**/*.md' 'completions/README.md'
shellcheck scripts/check-development.sh
ruff check scripts/development-container.py tests/test_development_container.py tests/test_shell_contracts.py
python3 -m unittest discover -s tests -p test_development_container.py
