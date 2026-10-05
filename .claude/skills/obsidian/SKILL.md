---
name: obsidian
description: Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian.
---

# Obsidian Vault

## Vault location

`/home/cyber/Documents/notes/second-brain`

Mostly flat at root level.

## GTD structure

The vault uses a GTD (Getting Things Done) workflow with the following folders under `GTD/`:

- `GTD/projects/` — active projects (things with more than one step, currently being worked on)
- `GTD/someday/` — someday/maybe items (not active, parked for later)
- `GTD/next-actions/` — standalone next actions not tied to a project

### Project notes

Every note in `GTD/projects/` and `GTD/someday/` **must** carry a `next_action` frontmatter property holding the immediate next physical action. Example:

```yaml
---
priority: medium
location: Computer
next_action: "pull repo from Hetzner and run locally"
---
```

This is a YAML property, **not** a body heading and not a Dataview inline `Next action::` field — the old inline form was migrated away and Bases cannot read it. When moving a note into `GTD/projects/`, always add or update this property. When editing a note, keep `next_action` current.

Recognised properties:

- `next_action` — required, quoted string
- `priority` — `high` / `medium` / `low` (drives grouping in the Active view)
- `location` — GTD context that enables the work, e.g. `Computer`, `Home`, `Errands`. Optional; shows as `-` when absent
- `status` — set to `inactive` to hide a note from the Active view

### Projects dashboard

`GTD/Projects.md` renders two views from `GTD/Projects.base` (Obsidian Bases, a core plugin):

- **Active** — `GTD/projects`, grouped by priority
- **Someday** — `GTD/someday`

Both are embedded with `![[Projects.base#ViewName]]`. Edit columns and filters in `Projects.base`, not in the note. Bases reads YAML frontmatter only, so any new queryable field has to be a property.

## Naming conventions

- **Index notes**: aggregate related topics (e.g., `Ralph Wiggum Index.md`, `Skills Index.md`, `RAG Index.md`)
- **lower case words joined with a dash** for all note names. Example: linux-commands-and-snippets.md
- No folders for organization - use links and index notes instead

## Linking

- Use Obsidian `[[wikilinks]]` syntax: `[[note-title]]`
- Notes link to dependencies/related notes at the bottom
- Index notes are just lists of `[[wikilinks]]`

## Workflows

### Search for notes

```bash
# Search by filename
find "/home/cyber/Documents/notes/second-brain/" -name "*.md" | grep -i "keyword"

# Search by content
grep -rl "keyword" "/home/cyber/Documents/notes/second-brain/" --include="*.md"
```

Or use Grep/Glob tools directly on the vault path.

### Create a new note

1. Use **lower case words joined with a dash** for filename
2. Write content as a unit of learning (per vault rules)
3. Add `[[wikilinks]]` to related notes at the bottom
4. If part of a numbered sequence, use the hierarchical numbering scheme

### Find related notes

Search for `[[note-title]]` across the vault to find backlinks:

```bash
grep -rl "\\[\\[note-title\\]\\]" "/home/cyber/Documents/notes/second-brain/"
```

### Find index notes

```bash
find "/home/cyber/Documents/notes/second-brain/" -name "*Index*"
```

