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

- Homebrew paths are resolved via `$HOMEBREW_PREFIX`, inherited from `~/.zprofile`
  in login shells and discovered from `/opt/homebrew/bin/brew` or
  `/usr/local/bin/brew` otherwise. This works on both Apple Silicon and Intel Macs.
- Machine-specific git settings (identity, signing key, 1Password signer path,
  allowed-signers file) live in untracked `~/.gitconfig.local`, included at the end
  of the tracked `~/.gitconfig`. Create that file on each new machine.
- `templates/ssh-config` is a starting point for `~/.ssh/config`; copy and edit it
  locally. `~/.ssh` itself is never stowed.
- `~/.zprofile` is intentionally unchanged: it is the only source of Homebrew's
  `fpath` additions and OrbStack completions.
- Deliberately **not** tracked: `~/.ssh/`, `~/.config/op/`,
  `~/.config/opencode/service.json` (contains a password), shell history,
  `.zcompdump`, `.zsh_sessions/`, OrbStack/Kube/Terraform/Docker state, and backups.
