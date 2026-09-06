"""Exercise shell contracts without installing configuration or invoking host tools."""
import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FISH = shutil.which('fish')


class ShellContractTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='fish-contract-')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.bin = self.root / 'bin'
        self.bin.mkdir()
        self.env = dict(os.environ, HOME=str(self.root), XDG_CONFIG_HOME=str(self.root / 'config'),
                        XDG_DATA_HOME=str(self.root / 'data'), XDG_CACHE_HOME=str(self.root / 'cache'),
                        XDG_STATE_HOME=str(self.root / 'state'), XDG_RUNTIME_DIR=str(self.root),
                        TERM='xterm-256color', FIXTURE_ROOT=str(self.root),
                        PATH=str(self.bin) + os.pathsep + os.environ['PATH'])
        self.env.pop('HYPRLAND_INSTANCE_SIGNATURE', None)
        self.env.pop('SSH_AUTH_SOCK', None)

    def command(self, name, script):
        p = self.bin / name
        p.write_text('#!/bin/sh\n' + script + '\n')
        p.chmod(0o755)

    def fish(self, script, interactive=False, stdin=''):
        return subprocess.run([FISH, '--no-config', *(['--interactive'] if interactive else []),
                               '-c', script], cwd=ROOT, env=self.env, input=stdin,
                              text=True, capture_output=True, timeout=15)

    def test_repeated_startup_without_optional_tools(self):
        for suffix in ('go/bin', '.local/bin', '.pixi/bin', '.local/share/pnpm/bin',
                       '.local/share/mise/shims'):
            (self.root / suffix).mkdir(parents=True, exist_ok=True)
        # The only executable in this startup PATH is a harmless terminal query.
        # No live optional initializer can run from the inherited host PATH.
        self.command('tty', 'echo /dev/fixture-tty')
        self.env['PATH'] = str(self.bin)
        for interactive in (False, True):
            with self.subTest(interactive=interactive):
                result = self.fish('''set -g fish_function_path $PWD/functions $fish_function_path
for item in conf.d/*.fish
    source $item
end
source config.fish
set -l first_path (string join : $PATH)
for item in conf.d/*.fish
    source $item
end
source config.fish
test "$first_path" = (string join : $PATH); or exit 31
test "$PATH[1]" = "$HOME/.local/share/mise/shims"; or exit 32
test "$EDITOR" = micro; or exit 33
test "$LANG" = en_US.UTF-8; or exit 34
if not status is-interactive
    abbr --query y; and exit 35
end
printf 'startup-ok\\n'
''', interactive)
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertEqual(result.stdout, 'startup-ok\n')

    def test_completion_sources_provide_real_suggestions(self):
        for name in ('uv', 'poetry'):
            self.command(name, 'echo forbidden-generator >&2\nexit 97')
        for query, expected in (('git --ver', '--version'), ('cargo --ver', '--version'),
                                ('uv syn', 'sync'), ('poetry ins', 'install')):
            with self.subTest(query=query):
                result = self.fish('set -g fish_complete_path $PWD/completions $fish_complete_path; '
                                   'complete -C "' + query + '"')
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertTrue(any(row.split('\t')[0] == expected for row in result.stdout.splitlines()),
                                result.stdout + result.stderr)
                self.assertNotIn('forbidden-generator', result.stderr)

    def test_btop_completions_load_without_invoking_btop(self):
        self.command('btop', 'echo forbidden-command >&2\nexit 97')
        result = self.fish('source completions/btop.fish; complete -C "btop --pre"')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('--preset', result.stdout)
        self.assertNotIn('forbidden-command', result.stderr)

    def test_failed_pid_query_preserves_tide_transport(self):
        self.command('pgrep', 'exit 2')
        # --no-config disables universal storage on current Fish. Substitute only
        # the variable-store scope in a copied snippet; keep query/control flow.
        source = (ROOT / 'conf.d/00-tide-state.fish').read_text()
        self.assertEqual(source.count('set -U'), 2)
        (self.root / 'tide-state.fish').write_text(source.replace('set -U', 'set -g'))
        result = self.fish('''for pid in 101 102 103 104 105 106
    set -g _tide_prompt_$pid fixture
end
source "$FIXTURE_ROOT/tide-state.fish"
for pid in 101 102 103 104 105 106
    set -q _tide_prompt_$pid; or exit 41
end
''', True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_navi_preserves_ghq_binding(self):
        self.command('navi', 'exit 97')
        result = self.fish('source conf.d/ghq_key_bindings.fish; '
                           'source conf.d/navi.fish; source conf.d/navi.fish; bind \\cg', True)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('__ghq_repository_search', result.stdout)

    def test_failed_cache_clear_does_not_claim_success(self):
        self.command('ccache', 'exit 23')
        self.env.pop('CCACHE_DIR', None)
        result = self.fish('source functions/ccache-clear.fish; ccache-clear', stdin='y\n')
        self.assertEqual(result.returncode, 23, result.stdout + result.stderr)
        self.assertNotIn('ccache cleared', result.stdout)

    def test_cache_clear_confirmation_with_and_without_custom_directory(self):
        self.command('ccache', 'printf "%s\\n" "$*" >> "$FIXTURE_ROOT/cache-calls"')
        for directory in (None, str(self.root / 'cache with spaces')):
            for answer, clears in (('y', True), ('Y', True), ('n', False), ('', False)):
                with self.subTest(directory=directory, answer=answer):
                    self.env.pop('CCACHE_DIR', None)
                    if directory is not None:
                        self.env['CCACHE_DIR'] = directory
                    calls = self.root / 'cache-calls'
                    calls.unlink(missing_ok=True)
                    result = self.fish('source functions/ccache-clear.fish; ccache-clear',
                                       stdin=answer + '\n')
                    self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                    self.assertEqual(calls.exists(), clears)
                    if clears:
                        self.assertEqual(calls.read_text(), '-C\n')
                        self.assertIn('ccache cleared', result.stdout)
                    else:
                        self.assertIn('cancelled', result.stdout)

    def test_failed_orphan_query_is_not_empty_success(self):
        self.command('pacman', 'echo "fixture query failed" >&2\nexit 2')
        self.command('sudo', 'echo forbidden-removal\nexit 97')
        result = self.fish('source functions/cleanup.fish; cleanup')
        self.assertNotEqual(result.returncode, 0)
        self.assertNotIn('No orphaned packages', result.stdout)
        self.assertNotIn('forbidden-removal', result.stdout)

    def test_lock_probe_failure_cannot_remove_lock(self):
        self.command('fuser', 'exit 97')
        lock = self.root / 'db.lck'
        lock.write_text('fixture lock')
        source = (ROOT / 'functions/fixpacman.fish').read_text()
        self.assertEqual(source.count('/var/lib/pacman/db.lck'), 1)
        (self.root / 'fixpacman.fish').write_text(source.replace('/var/lib/pacman/db.lck', str(lock)))
        self.command('sudo', 'printf "%s\\n" "$*" >> "$FIXTURE_ROOT/calls"\nexit 2')
        result = self.fish('source "$FIXTURE_ROOT/fixpacman.fish"; fixpacman')
        self.assertNotEqual(result.returncode, 0)
        calls = (self.root / 'calls').read_text()
        self.assertNotIn('rm ', calls)

    def test_lock_probe_outcomes_are_distinct(self):
        self.command('fuser', 'exit 97')
        lock = self.root / 'db.lck'
        lock.write_text('retain fixture')
        source = (ROOT / 'functions/fixpacman.fish').read_text()
        (self.root / 'fixpacman.fish').write_text(source.replace('/var/lib/pacman/db.lck', str(lock)))
        for status, diagnostic, removes in ((0, '', False), (1, 'probe-error', False), (1, '', True)):
            with self.subTest(status=status, diagnostic=diagnostic):
                calls = self.root / 'calls'
                calls.unlink(missing_ok=True)
                self.command('sudo', 'printf "%s\\n" "$*" >> "$FIXTURE_ROOT/calls"\n'
                             'if [ "$1" = fuser ]; then\n'
                             + (f'echo {diagnostic} >&2\n' if diagnostic else '')
                             + f'exit {status}\nfi\nexit 0')
                result = self.fish('source "$FIXTURE_ROOT/fixpacman.fish"; fixpacman')
                self.assertEqual(result.returncode == 0, removes, result.stdout + result.stderr)
                self.assertEqual('rm ' in calls.read_text(), removes)
                self.assertEqual(lock.read_text(), 'retain fixture')

    def test_empty_orphan_query_does_not_remove_packages(self):
        self.command('pacman', 'exit 1')
        self.command('sudo', 'echo forbidden-removal\nexit 97')
        result = self.fish('source functions/cleanup.fish; cleanup')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('No orphaned packages', result.stdout)
        self.assertNotIn('forbidden-removal', result.stdout)

    def test_successful_yazi_changes_to_selected_directory(self):
        self.command('yazi', 'for arg do case "$arg" in --cwd-file=*) printf "%s" "$FIXTURE_ROOT" > "${arg#*=}";; esac; done\nexit 0')
        result = self.fish('source functions/yy.fish; yy; and pwd')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout.strip(), str(self.root))
        self.assertEqual(list(self.root.glob('yazi-cwd.*')), [])

    def test_failed_yazi_retains_directory_and_status(self):
        self.command('yazi', 'for arg do case "$arg" in --cwd-file=*) printf "%s" "$FIXTURE_ROOT" > "${arg#*=}";; esac; done\nexit 19')
        result = self.fish('source functions/yy.fish; yy; set -l child_status $status; '
                           'pwd; exit $child_status')
        self.assertEqual(result.returncode, 19, result.stdout + result.stderr)
        self.assertEqual(result.stdout.strip(), str(ROOT))
        self.assertEqual(list(self.root.glob('yazi-cwd.*')), [])


if __name__ == '__main__':
    unittest.main()
