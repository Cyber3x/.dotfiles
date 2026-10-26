# dotfiles

Configs linked into `~` with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a
package whose contents mirror `~`, e.g. `nvim/.config/nvim` → `~/.config/nvim`. Packages and system
config come from the NixOS config in `~/nixos`.

## Install

```sh
git clone git@github.com:Cyber3x/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow */
```

Stow refuses to overwrite existing files. Move them away first, or adopt them with `stow --adopt <package>`
and review the result with `git diff`.

Claude Code does not read `~/.agents/skills`, so link each shared skill:

```sh
mkdir -p ~/.claude/skills
for skill in ~/.agents/skills/*/; do ln -sfn "../../.agents/skills/$(basename "$skill")" ~/.claude/skills/; done
```

## Packages

| Package | Contents |
|---|---|
| `agents` | Tool-agnostic agent config: global `AGENTS.md` and skills (`~/.agents`) |
| `claude` | Claude Code settings and status line; `CLAUDE.md` links to `agents` |
| `pi` | Pi settings, MCP servers, UI config; `AGENTS.md` links to `agents` |
| `bash` | Bash config, split into `~/.config/bash/*.sh`, with per-host overrides in `hosts/<hostname>.sh` |
| `bin` | Scripts in `~/.local/bin` |
| `git` | Git config and global ignore |
| `nvim`, `ideavim`, `ghostty`, `btop`, `herdr` | Editor, terminal and tool configs |

## Not tracked

Set these up by hand on a new machine:

- `~/.gitconfig.local`: per-machine git overrides, e.g. `user.signingkey`
- `bash/.config/bash/hosts/bogdan.sh`: work machine overrides, ignored on purpose
- Pi credentials and state in `~/.pi/agent`: `auth.json`, `mcp-auth.json`, `models-store.json`, `trust.json`,
  `sessions/`, `npm/`
- herdr integration scripts, written by herdr's installer: `~/.claude/hooks/herdr-agent-state.sh`,
  `~/.pi/agent/extensions/herdr-agent-state.ts`
- `~/.claude/skills/synced`: managed by the Claude app
