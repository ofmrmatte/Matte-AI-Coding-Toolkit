# Architecture — Taskboard

## Current shape

```text
Browser
  -> Next.js App Router
      -> Server Components for reads
      -> Server Actions for form mutations
      -> Route Handlers only where an HTTP endpoint is actually needed
          -> Drizzle ORM
              -> PostgreSQL
```

The application is a modular monolith. There is one repository, one database and one production deployment.

## Main areas

```text
src/app/                 routes and page composition
src/features/tasks/      task rules, queries and mutations
src/features/users/      owner lookup used by task forms and filters
src/db/                  schema, database client and migrations
src/lib/                 small shared utilities with more than one real consumer
```

## Invariants

- task status must be one of `open`, `in_progress`, `done`;
- a task cannot reference an owner that does not exist;
- timestamps are stored in UTC;
- the database owns task identity and persistence;
- filtering rules should live with the task query layer, not be duplicated in page components;
- Server Components are preferred for read-only page data unless client state is required.

## Data model

`users`

- `id`
- `name`
- `email`

`tasks`

- `id`
- `title`
- `description`
- `owner_id`
- `status`
- `due_date`
- `created_at`
- `updated_at`

## Failure handling

Validation errors are returned to the form and do not create partial records. Unexpected database errors are logged server-side and shown to users as a generic failure state.

## Things intentionally not present

There is no Redis, event bus, background worker or separate API service. Add one only after a requirement cannot be handled safely by the current architecture.
