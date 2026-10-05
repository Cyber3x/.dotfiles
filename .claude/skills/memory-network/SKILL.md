---
name: memory-network
description: Read from and write to the curated cross-project memory network at ~/Documents/notes/ai-memories. Use when the user says remember this, save this as a memory, what do you know about X, check my memories, or when a stated preference, correction, or decision should persist across sessions. Not the harness auto-memory; this is hand-curated.
---

# Memory network

Location: `~/Documents/notes/ai-memories/`. Atomic notes linked with `[[wikilinks]]`; `MEMORY.md` is the topic index. Shared across all projects. Separate from the harness auto-memory under `~/.claude/projects/*/memory/`, which is never copied here.

## Read

1. Read `MEMORY.md`, pick the relevant hub: `neven` (user + all rules), the project note, `obsidian-vault`.
2. Follow `[[links]]` from there. Read only what the task needs.

## Write

Save only what is not derivable from the repo, git history or CLAUDE.md: corrections, preferences, decisions, cross-project facts. Absolute dates.

1. Search the folder for an existing note on the topic (`grep -ril <topic>`). Extend or correct it rather than create a duplicate. Fold project variants into the general rule (pattern: `commit-message-style`).
2. If new, one fact per file, kebab-case filename equal to `name`:

```markdown
---
name: <slug>
description: "<one line used to judge relevance>"
metadata:
  type: user | feedback | project | reference
---

<fact>

**Why:** <what prompted it>
**How to apply:** <concrete behavior>

Related: [[hub]], [[sibling]]
```

3. Link both ways: add `[[slug]]` in at least one existing note, and one line under the right heading in `MEMORY.md` as `- [Title](slug.md) — hook`.
4. Delete or correct notes that turn out wrong. Keep notes terse: decision, numbers, gotchas.
