# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory
is a "package"; inside it, files live at their path relative to `$HOME`.

## Install

From this directory (its parent is `$HOME`, so Stow's default target is correct):

```sh
stow -v zsh git ghostty nvim bat btop fastfetch gh opencode
```

Re-link after edits with `stow -R <package>`, and undo with `stow -D <package>`.

## Packages

| Package | Targets |
| --- | --- |
| `zsh` | `~/.zshrc`, `~/.zprofile` |
| `git` | `~/.gitconfig` |
| `ghostty` | `~/.config/ghostty/` |
| `nvim` | `~/.config/nvim/` |
| `bat` | `~/.config/bat/` |
| `btop` | `~/.config/btop/` |
| `fastfetch` | `~/.config/fastfetch/` |
| `gh` | `~/.config/gh/` |
| `opencode` | `~/.config/opencode/cli.json` |

`Brewfile` is documentation only; install with `brew bundle`.

## Notes

- These are **Phase 1** configs: tracked as-is, tied to this Mac. Absolute paths such
  as `/opt/homebrew`, `/Applications/1Password.app`, and
  `/Users/yamilurbina/.ssh/allowed_signers` are intentional.
- Deliberately **not** tracked: `~/.ssh/`, `~/.config/op/`,
  `~/.config/opencode/service.json` (contains a password), shell history,
  `.zcompdump`, `.zsh_sessions/`, OrbStack/Kube/Terraform/Docker state, and backups.
- Phase 2 (only if using a second machine): switch Homebrew paths to
  `$(brew --prefix)`, move machine-specific git settings into `~/.gitconfig.local`,
  and keep `ssh/config` as a local-only file.
