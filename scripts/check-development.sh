#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
# Syntax checks do not load this checkout as the active Fish configuration.
bash .githooks/pre-push
python3 scripts/check-markdown.py
shellcheck scripts/check-development.sh
ruff check scripts/check-markdown.py tests/test_markdown.py scripts/development-container.py tests/test_development_container.py tests/test_shell_contracts.py
python3 -m unittest discover -s tests -p test_development_container.py
python3 -m unittest discover -s tests -p test_markdown.py
