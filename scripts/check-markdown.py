#!/usr/bin/env python3
"""Lint tracked Markdown selected by the shared source-lint policy."""
import argparse
import fnmatch
import json
import os
import subprocess
from pathlib import Path


def select(root):
    config = json.loads((root / ".github/source-lint.json").read_text())
    patterns = config.get("markdown")
    excludes = config.get("exclude", [])
    if not isinstance(patterns, list) or not patterns or not all(isinstance(p, str) and p for p in patterns):
        raise ValueError("Markdown policy needs nonempty glob strings")
    if not isinstance(excludes, list) or not all(isinstance(p, str) and p for p in excludes):
        raise ValueError("Source exclusions need nonempty glob strings")
    # Match the shared selector's Git-tracked input and fnmatch semantics. In
    # particular, '*' includes '/' and therefore hidden editor documentation.
    environment = {key: value for key, value in os.environ.items() if not key.startswith("GIT_")}
    raw = subprocess.check_output(["git", "ls-files", "-z"], cwd=root, env=environment)
    selected = []
    for value in raw.split(b"\0"):
        if not value:
            continue
        name = value.decode()
        if name.startswith((".specify/", ".agents/")) or any(fnmatch.fnmatchcase(name, p) for p in excludes):
            continue
        if not any(fnmatch.fnmatchcase(name, p) for p in patterns):
            continue
        path = root / name
        if path.is_symlink() or not path.resolve().is_relative_to(root.resolve()):
            raise ValueError(f"Refusing symlink source: {name}")
        if path.suffix == ".md":
            if not path.is_file():
                raise ValueError(f"Missing tracked Markdown source: {name}")
            selected.append(name)
    if not selected:
        raise ValueError("Markdown policy matched no tracked files")
    return selected


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--list", action="store_true")
    args = parser.parse_args()
    root = args.root.resolve()
    files = select(root)
    if args.list:
        print(json.dumps(files, indent=2))
        return
    # '--' makes every selected path literal, including whitespace/leading '-'.
    raise SystemExit(subprocess.run(["markdownlint-cli2", "--", *files], cwd=root, check=False).returncode)


if __name__ == "__main__":
    main()
