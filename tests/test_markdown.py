"""Tracked Markdown coverage and failure propagation; isolated Git fixtures only."""
import importlib.util
import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "scripts/check-markdown.py"
spec = importlib.util.spec_from_file_location("check_markdown", SCRIPT)
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)


class MarkdownSelection(unittest.TestCase):
    def prepare(self, root):
        environment = {key: value for key, value in os.environ.items() if not key.startswith("GIT_")}
        subprocess.run(["git", "init", "--quiet", str(root)], env=environment, check=True)
        (root / ".github").mkdir()
        (root / ".github/source-lint.json").write_text(json.dumps({"markdown": ["*.md"]}))
        rules = json.loads((SCRIPT.parents[1] / ".markdownlint.json").read_text())
        (root / ".markdownlint.json").write_text(json.dumps(rules))
        names = ["README.md", ".devcontainer/README.md", ".vscode/README.md", "specs/003-new/plan.md", "docs/space name.md", "-option.md", ".agents/managed.md", ".specify/managed.md"]
        for name in names:
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("# Fixture\n")
        subprocess.run(["git", "-C", str(root), "add", "--force", "--all"], env=environment, check=True)
        (root / "untracked.md").write_text("# Not selected\n")
        return names

    def test_shared_tracked_selection_includes_hidden_and_other_specs(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            names = self.prepare(root)
            self.assertEqual(checker.select(root), [name for name in sorted(names) if not name.startswith((".agents/", ".specify/"))])

    def test_exclusions_symlinks_and_empty_matches(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.prepare(root)
            policy = root / ".github/source-lint.json"
            policy.write_text(json.dumps({"markdown": ["*.md"], "exclude": [".vscode/*"]}))
            self.assertNotIn(".vscode/README.md", checker.select(root))
            (root / "README.md").unlink()
            (root / "README.md").symlink_to(root / "untracked.md")
            with self.assertRaises(ValueError):
                checker.select(root)
            policy.write_text(json.dumps({"markdown": ["missing/*.md"]}))
            with self.assertRaises(ValueError):
                checker.select(root)

    def test_invalid_hidden_markdown_fails_real_linter(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.prepare(root)
            command = [sys.executable, str(SCRIPT), "--root", str(root)]
            valid = subprocess.run(command, capture_output=True, text=True, check=False)
            self.assertEqual(valid.returncode, 0, valid.stdout + valid.stderr)
            (root / ".vscode/README.md").write_text("# Fixture\n\n[broken]()\n")
            invalid = subprocess.run(command, capture_output=True, text=True, check=False)
            self.assertNotEqual(invalid.returncode, 0)
            self.assertIn("MD042", invalid.stdout + invalid.stderr)


if __name__ == "__main__":
    unittest.main()
