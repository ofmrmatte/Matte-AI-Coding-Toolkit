# ARCHITECTURE.md

Describe the architecture that exists now. Keep aspirational redesigns in proposals/decisions until they are implemented.

## System summary

<short description>

## Components

| Component | Responsibility | Technology | Owner/Boundary |
|---|---|---|---|
| <name> | <responsibility> | <stack> | <boundary> |

## Main data flows

```text
<input> → <component> → <component> → <storage/output>
```

## Persistence

- Primary store: <...>
- Schema/migrations: <...>
- Backup/recovery: <...>

## External integrations

| Integration | Purpose | Direction | Failure behavior |
|---|---|---|---|
| <service> | <purpose> | inbound/outbound | <behavior> |

## Authentication and authorization

<current model>

## Deployment

<where/how the system runs>

## Invariants

Rules that must remain true:

1. <invariant>
2. <invariant>

## Known constraints / technical debt

- <constraint with impact>

## Validation paths

- Unit: <commands/scope>
- Integration: <commands/scope>
- Build: <command>
- Smoke/E2E: <command or process>

Update this file only when the implemented architecture changes materially.
