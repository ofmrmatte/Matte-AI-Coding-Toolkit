# Project — Taskboard

## Purpose

Taskboard is a small internal web app for a team to register operational tasks, assign an owner and track work through `open`, `in_progress` and `done`.

The first version exists to replace a shared spreadsheet. It is not intended to become a general project-management platform.

## Users

- operations analysts who create and update tasks;
- a coordinator who filters work by owner and status.

## Scope

Included in the first release:

- create, edit and close tasks;
- title, description, owner, due date and status;
- list filters by owner and status;
- activity timestamp for the last update;
- basic responsive layout.

Out of scope for now:

- comments;
- file attachments;
- notifications;
- recurring tasks;
- external customer access;
- real-time collaboration.

## Constraints

- keep one deployable application;
- PostgreSQL is the source of truth;
- avoid a queue or cache until there is a measured need;
- all database changes go through versioned migrations;
- destructive data changes require an explicit migration and rollback note.

## Acceptance baseline

Before a change is considered complete, run the checks documented in `AGENTS.md`. UI changes also require opening the affected screen at desktop and mobile widths.
