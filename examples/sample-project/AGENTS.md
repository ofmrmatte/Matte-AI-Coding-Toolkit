# AGENTS.md — Taskboard

These rules apply to changes in this sample project.

## Before editing

Read `PROJECT.md`, `ARCHITECTURE.md`, `DECISIONS.md` and the relevant task in `TODO.md`.

Inspect the existing implementation before changing structure or dependencies. Preserve the modular-monolith boundary unless a task explicitly changes it.

## Commands

Use the project's real scripts:

```bash
pnpm lint
pnpm typecheck
pnpm test
pnpm build
```

For a focused bug fix, run the narrow test first, then the full applicable gates before completion.

## Database

- Use versioned migrations for schema changes.
- Do not edit an already-applied migration to change production history.
- Preserve foreign-key integrity between tasks and users.
- Explain rollback for destructive or data-shaping migrations.

## Task rules

- Valid statuses are `open`, `in_progress` and `done`.
- Do not duplicate filtering or status-transition rules inside page components.
- Keep server-side validation authoritative even when the UI validates the same field.

## UI

Open affected screens after visual changes. At minimum, check a narrow mobile viewport and a desktop viewport for changes to task forms, cards, filters or navigation.

Do not mark a visual task complete from JSX/CSS inspection alone.

## Completion

Report:

- what changed;
- what was tested;
- lint/typecheck/test/build as `PASS`, `FAIL` or `NOT RUN`;
- any known limitation left in `TODO.md`.
