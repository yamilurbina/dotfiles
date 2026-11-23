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
| `zsh` | `~/.zshrc` |
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

- There is no `~/.zprofile`; all zsh setup lives in `~/.zshrc`. Homebrew's prefix is
  inherited from the environment when available, otherwise discovered from
  `/opt/homebrew/bin/brew` or `/usr/local/bin/brew`, so this works on both Apple
  Silicon and Intel Macs. Homebrew's env vars, `bin` path, and completion `fpath`
  are set there, as is the guarded OrbStack integration.
- Machine-specific git settings (identity, signing key, 1Password signer path,
  allowed-signers file) live in untracked `~/.gitconfig.local`, included at the end
  of the tracked `~/.gitconfig`. Create that file on each new machine.
- `templates/ssh-config` is a starting point for `~/.ssh/config`; copy and edit it
  locally. `~/.ssh` itself is never stowed.
- Deliberately **not** tracked: `~/.ssh/`, `~/.config/op/`,
  `~/.config/opencode/service.json` (contains a password), shell history,
  `.zcompdump`, `.zsh_sessions/`, OrbStack/Kube/Terraform/Docker state, and backups.
