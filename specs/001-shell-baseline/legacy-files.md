# Legacy source ownership

2026-09-06 baseline at `3bc6cc8`: 202 files. The corrected current tree has
26 snippets, 152 function/support files and 15 completion files (193 Fish/disabled artifacts), plus the new completion maintenance README. These are source files, not 202 separately installed plugins.
All rows link to the specific behavior family in [legacy-contracts.md](legacy-contracts.md).
The two .disabled fnm files are retained inactive material. Syntax verification
covers active .fish files; behavior and unexecuted integration limits remain in
the owning contract.

| Source | Contract | Role |
| --- | --- | --- |
| [completions/bat.fish](../../completions/bat.fish) | LC-006 | bat completion definitions |
| [completions/btop.fish](../../completions/btop.fish) | LC-006 | btop completion definitions |
| [completions/copilot.fish](../../completions/copilot.fish) | LC-006 | copilot completion definitions |
| [completions/docker.fish](../../completions/docker.fish) | LC-006 | docker completion definitions |
| [completions/fd.fish](../../completions/fd.fish) | LC-006 | fd completion definitions |
| [completions/fnm.fish.disabled](../../completions/fnm.fish.disabled) | LC-006 | Inactive fnm completion |
| [completions/fzf.fish](../../completions/fzf.fish) | LC-006 | fzf completion definitions |
| [completions/gh.fish](../../completions/gh.fish) | LC-006 | gh completion definitions |
| [completions/ghq.fish](../../completions/ghq.fish) | LC-006 | ghq completion definitions |
| [completions/just.fish](../../completions/just.fish) | LC-006 | just completion definitions |
| [completions/mise.fish](../../completions/mise.fish) | LC-006 | mise completion definitions |
| [completions/poetry.fish](../../completions/poetry.fish) | LC-006 | poetry completion definitions |
| [completions/rustup.fish](../../completions/rustup.fish) | LC-006 | rustup completion definitions |
| [completions/tide.fish](../../completions/tide.fish) | LC-006 | tide completion definitions |
| [completions/uv.fish](../../completions/uv.fish) | LC-006 | uv completion definitions |
| [conf.d/00-options.fish](../../conf.d/00-options.fish) | LC-002 | 00-options startup integration |
| [conf.d/00-tide-state.fish](../../conf.d/00-tide-state.fish) | LC-002 | 00-tide-state startup integration |
| [conf.d/_pure_init.fish](../../conf.d/_pure_init.fish) | LC-002 | _pure_init startup integration |
| [conf.d/_tide_init.fish](../../conf.d/_tide_init.fish) | LC-002 | _tide_init startup integration |
| [conf.d/autopair.fish](../../conf.d/autopair.fish) | LC-002 | autopair startup integration |
| [conf.d/ccache.fish](../../conf.d/ccache.fish) | LC-002 | ccache startup integration |
| [conf.d/done.fish](../../conf.d/done.fish) | LC-002 | done startup integration |
| [conf.d/env-fixes.fish](../../conf.d/env-fixes.fish) | LC-002 | env-fixes startup integration |
| [conf.d/fnm.fish.disabled](../../conf.d/fnm.fish.disabled) | LC-002 | Inactive fnm initializer |
| [conf.d/fzf.fish](../../conf.d/fzf.fish) | LC-002 | fzf startup integration |
| [conf.d/ghq_key_bindings.fish](../../conf.d/ghq_key_bindings.fish) | LC-002 | ghq_key_bindings startup integration |
| [conf.d/git-abbr.fish](../../conf.d/git-abbr.fish) | LC-002 | git-abbr startup integration |
| [conf.d/gpg.fish](../../conf.d/gpg.fish) | LC-002 | gpg startup integration |
| [conf.d/keychain.fish](../../conf.d/keychain.fish) | LC-002 | keychain startup integration |
| [conf.d/navi.fish](../../conf.d/navi.fish) | LC-002 | navi startup integration |
| [conf.d/pager.fish](../../conf.d/pager.fish) | LC-002 | pager startup integration |
| [conf.d/pisces.fish](../../conf.d/pisces.fish) | LC-002 | pisces startup integration |
| [conf.d/pnpm.fish](../../conf.d/pnpm.fish) | LC-002 | pnpm startup integration |
| [conf.d/pure.fish](../../conf.d/pure.fish) | LC-002 | pure startup integration |
| [conf.d/python.fish](../../conf.d/python.fish) | LC-002 | python startup integration |
| [conf.d/rust.fish](../../conf.d/rust.fish) | LC-002 | rust startup integration |
| [conf.d/rustup.fish](../../conf.d/rustup.fish) | LC-002 | rustup startup integration |
| [conf.d/tide.fish](../../conf.d/tide.fish) | LC-002 | tide startup integration |
| [conf.d/vite-plus.fish](../../conf.d/vite-plus.fish) | LC-002 | vite-plus startup integration |
| [conf.d/zoxide.fish](../../conf.d/zoxide.fish) | LC-002 | zoxide startup integration |
| [conf.d/zz-mise.fish](../../conf.d/zz-mise.fish) | LC-002 | zz-mise startup integration |
| [functions/.......fish](../../functions/.......fish) | LC-003 | .......fish navigation/terminal command |
| [functions/......fish](../../functions/......fish) | LC-003 | ......fish navigation/terminal command |
| [functions/.....fish](../../functions/.....fish) | LC-003 | .....fish navigation/terminal command |
| [functions/....fish](../../functions/....fish) | LC-003 | ....fish navigation/terminal command |
| [functions/...fish](../../functions/...fish) | LC-003 | ...fish navigation/terminal command |
| [functions/__fzf_cd.fish](../../functions/__fzf_cd.fish) | LC-005 | __fzf_cd prompt/editing support |
| [functions/__fzf_complete.fish](../../functions/__fzf_complete.fish) | LC-005 | __fzf_complete prompt/editing support |
| [functions/__fzf_complete_preview.fish](../../functions/__fzf_complete_preview.fish) | LC-005 | __fzf_complete_preview prompt/editing support |
| [functions/__fzf_find_file.fish](../../functions/__fzf_find_file.fish) | LC-005 | __fzf_find_file prompt/editing support |
| [functions/__fzf_get_dir.fish](../../functions/__fzf_get_dir.fish) | LC-005 | __fzf_get_dir prompt/editing support |
| [functions/__fzf_open.fish](../../functions/__fzf_open.fish) | LC-005 | __fzf_open prompt/editing support |
| [functions/__fzf_parse_commandline.fish](../../functions/__fzf_parse_commandline.fish) | LC-005 | __fzf_parse_commandline prompt/editing support |
| [functions/__fzf_reverse_isearch.fish](../../functions/__fzf_reverse_isearch.fish) | LC-005 | __fzf_reverse_isearch prompt/editing support |
| [functions/__fzfcmd.fish](../../functions/__fzfcmd.fish) | LC-005 | __fzfcmd prompt/editing support |
| [functions/__ghq_repository_search.fish](../../functions/__ghq_repository_search.fish) | LC-005 | __ghq_repository_search prompt/editing support |
| [functions/_pisces_append.fish](../../functions/_pisces_append.fish) | LC-005 | _pisces_append prompt/editing support |
| [functions/_pisces_backspace.fish](../../functions/_pisces_backspace.fish) | LC-005 | _pisces_backspace prompt/editing support |
| [functions/_pisces_bind_pair.fish](../../functions/_pisces_bind_pair.fish) | LC-005 | _pisces_bind_pair prompt/editing support |
| [functions/_pisces_complete.fish](../../functions/_pisces_complete.fish) | LC-005 | _pisces_complete prompt/editing support |
| [functions/_pisces_insert_identical.fish](../../functions/_pisces_insert_identical.fish) | LC-005 | _pisces_insert_identical prompt/editing support |
| [functions/_pisces_insert_left.fish](../../functions/_pisces_insert_left.fish) | LC-005 | _pisces_insert_left prompt/editing support |
| [functions/_pisces_insert_right.fish](../../functions/_pisces_insert_right.fish) | LC-005 | _pisces_insert_right prompt/editing support |
| [functions/_pisces_jump.fish](../../functions/_pisces_jump.fish) | LC-005 | _pisces_jump prompt/editing support |
| [functions/_pisces_lookup.fish](../../functions/_pisces_lookup.fish) | LC-005 | _pisces_lookup prompt/editing support |
| [functions/_pisces_remove.fish](../../functions/_pisces_remove.fish) | LC-005 | _pisces_remove prompt/editing support |
| [functions/_pisces_should_insert.fish](../../functions/_pisces_should_insert.fish) | LC-005 | _pisces_should_insert prompt/editing support |
| [functions/_pisces_skip.fish](../../functions/_pisces_skip.fish) | LC-005 | _pisces_skip prompt/editing support |
| [functions/_tide_1_line_prompt.fish](../../functions/_tide_1_line_prompt.fish) | LC-005 | _tide_1_line_prompt prompt/editing support |
| [functions/_tide_2_line_prompt.fish](../../functions/_tide_2_line_prompt.fish) | LC-005 | _tide_2_line_prompt prompt/editing support |
| [functions/_tide_cache_variables.fish](../../functions/_tide_cache_variables.fish) | LC-005 | _tide_cache_variables prompt/editing support |
| [functions/_tide_detect_os.fish](../../functions/_tide_detect_os.fish) | LC-005 | _tide_detect_os prompt/editing support |
| [functions/_tide_find_and_remove.fish](../../functions/_tide_find_and_remove.fish) | LC-005 | _tide_find_and_remove prompt/editing support |
| [functions/_tide_fish_colorize.fish](../../functions/_tide_fish_colorize.fish) | LC-005 | _tide_fish_colorize prompt/editing support |
| [functions/_tide_item_aws.fish](../../functions/_tide_item_aws.fish) | LC-005 | _tide_item_aws prompt/editing support |
| [functions/_tide_item_bun.fish](../../functions/_tide_item_bun.fish) | LC-005 | _tide_item_bun prompt/editing support |
| [functions/_tide_item_character.fish](../../functions/_tide_item_character.fish) | LC-005 | _tide_item_character prompt/editing support |
| [functions/_tide_item_cmd_duration.fish](../../functions/_tide_item_cmd_duration.fish) | LC-005 | _tide_item_cmd_duration prompt/editing support |
| [functions/_tide_item_context.fish](../../functions/_tide_item_context.fish) | LC-005 | _tide_item_context prompt/editing support |
| [functions/_tide_item_crystal.fish](../../functions/_tide_item_crystal.fish) | LC-005 | _tide_item_crystal prompt/editing support |
| [functions/_tide_item_direnv.fish](../../functions/_tide_item_direnv.fish) | LC-005 | _tide_item_direnv prompt/editing support |
| [functions/_tide_item_distrobox.fish](../../functions/_tide_item_distrobox.fish) | LC-005 | _tide_item_distrobox prompt/editing support |
| [functions/_tide_item_docker.fish](../../functions/_tide_item_docker.fish) | LC-005 | _tide_item_docker prompt/editing support |
| [functions/_tide_item_elixir.fish](../../functions/_tide_item_elixir.fish) | LC-005 | _tide_item_elixir prompt/editing support |
| [functions/_tide_item_gcloud.fish](../../functions/_tide_item_gcloud.fish) | LC-005 | _tide_item_gcloud prompt/editing support |
| [functions/_tide_item_git.fish](../../functions/_tide_item_git.fish) | LC-005 | _tide_item_git prompt/editing support |
| [functions/_tide_item_go.fish](../../functions/_tide_item_go.fish) | LC-005 | _tide_item_go prompt/editing support |
| [functions/_tide_item_java.fish](../../functions/_tide_item_java.fish) | LC-005 | _tide_item_java prompt/editing support |
| [functions/_tide_item_jobs.fish](../../functions/_tide_item_jobs.fish) | LC-005 | _tide_item_jobs prompt/editing support |
| [functions/_tide_item_kubectl.fish](../../functions/_tide_item_kubectl.fish) | LC-005 | _tide_item_kubectl prompt/editing support |
| [functions/_tide_item_nix_shell.fish](../../functions/_tide_item_nix_shell.fish) | LC-005 | _tide_item_nix_shell prompt/editing support |
| [functions/_tide_item_node.fish](../../functions/_tide_item_node.fish) | LC-005 | _tide_item_node prompt/editing support |
| [functions/_tide_item_os.fish](../../functions/_tide_item_os.fish) | LC-005 | _tide_item_os prompt/editing support |
| [functions/_tide_item_php.fish](../../functions/_tide_item_php.fish) | LC-005 | _tide_item_php prompt/editing support |
| [functions/_tide_item_private_mode.fish](../../functions/_tide_item_private_mode.fish) | LC-005 | _tide_item_private_mode prompt/editing support |
| [functions/_tide_item_pulumi.fish](../../functions/_tide_item_pulumi.fish) | LC-005 | _tide_item_pulumi prompt/editing support |
| [functions/_tide_item_python.fish](../../functions/_tide_item_python.fish) | LC-005 | _tide_item_python prompt/editing support |
| [functions/_tide_item_ruby.fish](../../functions/_tide_item_ruby.fish) | LC-005 | _tide_item_ruby prompt/editing support |
| [functions/_tide_item_rustc.fish](../../functions/_tide_item_rustc.fish) | LC-005 | _tide_item_rustc prompt/editing support |
| [functions/_tide_item_shlvl.fish](../../functions/_tide_item_shlvl.fish) | LC-005 | _tide_item_shlvl prompt/editing support |
| [functions/_tide_item_status.fish](../../functions/_tide_item_status.fish) | LC-005 | _tide_item_status prompt/editing support |
| [functions/_tide_item_terraform.fish](../../functions/_tide_item_terraform.fish) | LC-005 | _tide_item_terraform prompt/editing support |
| [functions/_tide_item_time.fish](../../functions/_tide_item_time.fish) | LC-005 | _tide_item_time prompt/editing support |
| [functions/_tide_item_toolbox.fish](../../functions/_tide_item_toolbox.fish) | LC-005 | _tide_item_toolbox prompt/editing support |
| [functions/_tide_item_vi_mode.fish](../../functions/_tide_item_vi_mode.fish) | LC-005 | _tide_item_vi_mode prompt/editing support |
| [functions/_tide_item_zig.fish](../../functions/_tide_item_zig.fish) | LC-005 | _tide_item_zig prompt/editing support |
| [functions/_tide_parent_dirs.fish](../../functions/_tide_parent_dirs.fish) | LC-005 | _tide_parent_dirs prompt/editing support |
| [functions/_tide_print_item.fish](../../functions/_tide_print_item.fish) | LC-005 | _tide_print_item prompt/editing support |
| [functions/_tide_pwd.fish](../../functions/_tide_pwd.fish) | LC-005 | _tide_pwd prompt/editing support |
| [functions/_tide_remove_unusable_items.fish](../../functions/_tide_remove_unusable_items.fish) | LC-005 | _tide_remove_unusable_items prompt/editing support |
| [functions/_tide_sub_bug-report.fish](../../functions/_tide_sub_bug-report.fish) | LC-005 | _tide_sub_bug-report prompt/editing support |
| [functions/_tide_sub_configure.fish](../../functions/_tide_sub_configure.fish) | LC-005 | _tide_sub_configure prompt/editing support |
| [functions/_tide_sub_reload.fish](../../functions/_tide_sub_reload.fish) | LC-005 | _tide_sub_reload prompt/editing support |
| [functions/big.fish](../../functions/big.fish) | LC-004 | big explicit diagnostic/maintenance command |
| [functions/ccache-clear.fish](../../functions/ccache-clear.fish) | LC-004 | ccache-clear explicit diagnostic/maintenance command |
| [functions/ccache-stats.fish](../../functions/ccache-stats.fish) | LC-004 | ccache-stats explicit diagnostic/maintenance command |
| [functions/cleanup.fish](../../functions/cleanup.fish) | LC-004 | cleanup explicit diagnostic/maintenance command |
| [functions/copy.fish](../../functions/copy.fish) | LC-003 | copy navigation/terminal command |
| [functions/cpudetails.fish](../../functions/cpudetails.fish) | LC-004 | cpudetails explicit diagnostic/maintenance command |
| [functions/cpuinfo.fish](../../functions/cpuinfo.fish) | LC-004 | cpuinfo explicit diagnostic/maintenance command |
| [functions/diskdetails.fish](../../functions/diskdetails.fish) | LC-004 | diskdetails explicit diagnostic/maintenance command |
| [functions/egrep.fish](../../functions/egrep.fish) | LC-003 | egrep navigation/terminal command |
| [functions/fgrep.fish](../../functions/fgrep.fish) | LC-003 | fgrep navigation/terminal command |
| [functions/fish_mode_prompt.fish](../../functions/fish_mode_prompt.fish) | LC-005 | fish_mode_prompt prompt/editing support |
| [functions/fish_prompt.fish](../../functions/fish_prompt.fish) | LC-005 | fish_prompt prompt/editing support |
| [functions/fish_title.fish](../../functions/fish_title.fish) | LC-005 | fish_title prompt/editing support |
| [functions/fixpacman.fish](../../functions/fixpacman.fish) | LC-004 | fixpacman explicit diagnostic/maintenance command |
| [functions/gitpkg.fish](../../functions/gitpkg.fish) | LC-004 | gitpkg explicit diagnostic/maintenance command |
| [functions/gpuinfo.fish](../../functions/gpuinfo.fish) | LC-004 | gpuinfo explicit diagnostic/maintenance command |
| [functions/grubup.fish](../../functions/grubup.fish) | LC-004 | grubup explicit diagnostic/maintenance command |
| [functions/help.fish](../../functions/help.fish) | LC-003 | help navigation/terminal command |
| [functions/htop.fish](../../functions/htop.fish) | LC-003 | htop navigation/terminal command |
| [functions/hw.fish](../../functions/hw.fish) | LC-004 | hw explicit diagnostic/maintenance command |
| [functions/hx.fish](../../functions/hx.fish) | LC-003 | hx navigation/terminal command |
| [functions/hyprflow.fish](../../functions/hyprflow.fish) | LC-003 | hyprflow navigation/terminal command |
| [functions/jctl.fish](../../functions/jctl.fish) | LC-004 | jctl explicit diagnostic/maintenance command |
| [functions/l..fish](../../functions/l..fish) | LC-003 | l. navigation/terminal command |
| [functions/la.fish](../../functions/la.fish) | LC-003 | la navigation/terminal command |
| [functions/ld.fish](../../functions/ld.fish) | LC-003 | ld navigation/terminal command |
| [functions/lg.fish](../../functions/lg.fish) | LC-003 | lg navigation/terminal command |
| [functions/ll.fish](../../functions/ll.fish) | LC-003 | ll navigation/terminal command |
| [functions/ls.fish](../../functions/ls.fish) | LC-003 | ls navigation/terminal command |
| [functions/lt.fish](../../functions/lt.fish) | LC-003 | lt navigation/terminal command |
| [functions/mirror.fish](../../functions/mirror.fish) | LC-004 | mirror explicit diagnostic/maintenance command |
| [functions/nano.fish](../../functions/nano.fish) | LC-003 | nano navigation/terminal command |
| [functions/paste.fish](../../functions/paste.fish) | LC-003 | paste navigation/terminal command |
| [functions/pbuild.fish](../../functions/pbuild.fish) | LC-004 | pbuild explicit diagnostic/maintenance command |
| [functions/pcinfo.fish](../../functions/pcinfo.fish) | LC-004 | pcinfo explicit diagnostic/maintenance command |
| [functions/please.fish](../../functions/please.fish) | LC-004 | please explicit diagnostic/maintenance command |
| [functions/psmem.fish](../../functions/psmem.fish) | LC-004 | psmem explicit diagnostic/maintenance command |
| [functions/psmem10.fish](../../functions/psmem10.fish) | LC-004 | psmem10 explicit diagnostic/maintenance command |
| [functions/rip.fish](../../functions/rip.fish) | LC-004 | rip explicit diagnostic/maintenance command |
| [functions/tarnow.fish](../../functions/tarnow.fish) | LC-003 | tarnow navigation/terminal command |
| [functions/tb.fish](../../functions/tb.fish) | LC-003 | tb navigation/terminal command |
| [functions/tide.fish](../../functions/tide.fish) | LC-005 | tide prompt/editing support |
| [functions/tide/configure/choices/all/finish.fish](../../functions/tide/configure/choices/all/finish.fish) | LC-005 | finish prompt/editing support |
| [functions/tide/configure/choices/all/icons.fish](../../functions/tide/configure/choices/all/icons.fish) | LC-005 | icons prompt/editing support |
| [functions/tide/configure/choices/all/prompt_colors.fish](../../functions/tide/configure/choices/all/prompt_colors.fish) | LC-005 | prompt_colors prompt/editing support |
| [functions/tide/configure/choices/all/prompt_connection.fish](../../functions/tide/configure/choices/all/prompt_connection.fish) | LC-005 | prompt_connection prompt/editing support |
| [functions/tide/configure/choices/all/prompt_connection_andor_frame_color.fish](../../functions/tide/configure/choices/all/prompt_connection_andor_frame_color.fish) | LC-005 | prompt_connection_andor_frame_color prompt/editing support |
| [functions/tide/configure/choices/all/prompt_spacing.fish](../../functions/tide/configure/choices/all/prompt_spacing.fish) | LC-005 | prompt_spacing prompt/editing support |
| [functions/tide/configure/choices/all/show_time.fish](../../functions/tide/configure/choices/all/show_time.fish) | LC-005 | show_time prompt/editing support |
| [functions/tide/configure/choices/all/style.fish](../../functions/tide/configure/choices/all/style.fish) | LC-005 | style prompt/editing support |
| [functions/tide/configure/choices/all/transient.fish](../../functions/tide/configure/choices/all/transient.fish) | LC-005 | transient prompt/editing support |
| [functions/tide/configure/choices/classic/classic_prompt_color.fish](../../functions/tide/configure/choices/classic/classic_prompt_color.fish) | LC-005 | classic_prompt_color prompt/editing support |
| [functions/tide/configure/choices/classic/classic_prompt_separators.fish](../../functions/tide/configure/choices/classic/classic_prompt_separators.fish) | LC-005 | classic_prompt_separators prompt/editing support |
| [functions/tide/configure/choices/lean/lean_prompt_height.fish](../../functions/tide/configure/choices/lean/lean_prompt_height.fish) | LC-005 | lean_prompt_height prompt/editing support |
| [functions/tide/configure/choices/powerline/powerline_prompt_heads.fish](../../functions/tide/configure/choices/powerline/powerline_prompt_heads.fish) | LC-005 | powerline_prompt_heads prompt/editing support |
| [functions/tide/configure/choices/powerline/powerline_prompt_style.fish](../../functions/tide/configure/choices/powerline/powerline_prompt_style.fish) | LC-005 | powerline_prompt_style prompt/editing support |
| [functions/tide/configure/choices/powerline/powerline_prompt_tails.fish](../../functions/tide/configure/choices/powerline/powerline_prompt_tails.fish) | LC-005 | powerline_prompt_tails prompt/editing support |
| [functions/tide/configure/choices/powerline/powerline_right_prompt_frame.fish](../../functions/tide/configure/choices/powerline/powerline_right_prompt_frame.fish) | LC-005 | powerline_right_prompt_frame prompt/editing support |
| [functions/tide/configure/choices/rainbow/rainbow_prompt_separators.fish](../../functions/tide/configure/choices/rainbow/rainbow_prompt_separators.fish) | LC-005 | rainbow_prompt_separators prompt/editing support |
| [functions/tide/configure/configs/classic.fish](../../functions/tide/configure/configs/classic.fish) | LC-005 | classic prompt/editing support |
| [functions/tide/configure/configs/classic_16color.fish](../../functions/tide/configure/configs/classic_16color.fish) | LC-005 | classic_16color prompt/editing support |
| [functions/tide/configure/configs/lean.fish](../../functions/tide/configure/configs/lean.fish) | LC-005 | lean prompt/editing support |
| [functions/tide/configure/configs/lean_16color.fish](../../functions/tide/configure/configs/lean_16color.fish) | LC-005 | lean_16color prompt/editing support |
| [functions/tide/configure/configs/rainbow.fish](../../functions/tide/configure/configs/rainbow.fish) | LC-005 | rainbow prompt/editing support |
| [functions/tide/configure/configs/rainbow_16color.fish](../../functions/tide/configure/configs/rainbow_16color.fish) | LC-005 | rainbow_16color prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_cache_variables.fish](../../functions/tide/configure/functions/_fake_tide_cache_variables.fish) | LC-005 | _fake_tide_cache_variables prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_item_character.fish](../../functions/tide/configure/functions/_fake_tide_item_character.fish) | LC-005 | _fake_tide_item_character prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_item_cmd_duration.fish](../../functions/tide/configure/functions/_fake_tide_item_cmd_duration.fish) | LC-005 | _fake_tide_item_cmd_duration prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_item_git.fish](../../functions/tide/configure/functions/_fake_tide_item_git.fish) | LC-005 | _fake_tide_item_git prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_item_newline.fish](../../functions/tide/configure/functions/_fake_tide_item_newline.fish) | LC-005 | _fake_tide_item_newline prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_item_os.fish](../../functions/tide/configure/functions/_fake_tide_item_os.fish) | LC-005 | _fake_tide_item_os prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_item_time.fish](../../functions/tide/configure/functions/_fake_tide_item_time.fish) | LC-005 | _fake_tide_item_time prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_print_item.fish](../../functions/tide/configure/functions/_fake_tide_print_item.fish) | LC-005 | _fake_tide_print_item prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_prompt.fish](../../functions/tide/configure/functions/_fake_tide_prompt.fish) | LC-005 | _fake_tide_prompt prompt/editing support |
| [functions/tide/configure/functions/_fake_tide_pwd.fish](../../functions/tide/configure/functions/_fake_tide_pwd.fish) | LC-005 | _fake_tide_pwd prompt/editing support |
| [functions/tide/configure/icons.fish](../../functions/tide/configure/icons.fish) | LC-005 | icons prompt/editing support |
| [functions/untar.fish](../../functions/untar.fish) | LC-003 | untar navigation/terminal command |
| [functions/update.fish](../../functions/update.fish) | LC-004 | update explicit diagnostic/maintenance command |
| [functions/vdir.fish](../../functions/vdir.fish) | LC-003 | vdir navigation/terminal command |
| [functions/yy.fish](../../functions/yy.fish) | LC-003 | yy navigation/terminal command |

| [completions/README.md](../../completions/README.md) | LC-006 | Completion generation and fallback maintenance |

## Retired completion shadows

The following baseline files are intentionally removed so Fish can select its
packaged or embedded completion. They are not undocumented missing files.

- `completions/cargo.fish`: empty shadow; use Fish fallback.
- `completions/exa.fish`: empty shadow; use Fish fallback.
- `completions/git.fish`: empty shadow; use Fish fallback.
- `completions/lazygit.fish`: empty shadow; use Fish fallback.
- `completions/pip.fish`: invalid command/generator output; use Fish fallback.
- `completions/pipx.fish`: empty shadow; use Fish fallback.
- `completions/rg.fish`: empty shadow; use Fish fallback.
- `completions/rustc.fish`: empty shadow; use Fish fallback.
- `completions/yarn.fish`: invalid command/generator output; use Fish fallback.
