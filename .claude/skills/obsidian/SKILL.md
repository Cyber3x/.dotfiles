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

Every note in `GTD/projects/` **must** include a `# Next action::` heading followed by the immediate next physical action. Example:

```
# Next action:: pull repo from Hetzner and run locally
```

This is a top-level markdown heading, not a hashtag tag. When moving a note into `GTD/projects/`, always add or update this heading. When editing a project note, keep the `# Next action::` line current.

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

