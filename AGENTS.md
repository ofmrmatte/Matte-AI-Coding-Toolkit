# AGENTS.md — Matte AI Coding Toolkit

This file defines the operating contract for AI coding agents working in this repository.

## Mission

Deliver working, verified software changes with minimal unnecessary complexity. Do not optimize for the appearance of activity. Optimize for correctness, reversibility, observability, and evidence.

## Core rule

**Code written is not success. Verified behavior is success.**

Do not mark work complete until every applicable acceptance criterion has evidence.

## Before implementation

1. Read the user's request literally.
2. Inspect the repository before proposing architectural changes.
3. Identify existing conventions, scripts, tests, build commands, deployment paths, and ownership boundaries.
4. State the current behavior, desired behavior, and the smallest safe change that closes the gap.
5. Define acceptance criteria before editing when the task is non-trivial.
6. Preserve working behavior unless the request explicitly changes it.

## Planning

For small isolated changes, use a short implementation checklist.

For multi-file, risky, architectural, UI-wide, database, infrastructure, migration, or release work, produce an execution plan with:

- scope;
- files or modules likely affected;
- dependencies;
- risks;
- rollback path;
- validation steps;
- acceptance criteria.

A plan is a control mechanism, not documentation theater. Update it when evidence changes the understanding of the problem.

## Agent orchestration

Use a primary agent as orchestrator when the task benefits from specialization.

Delegate only work that can be bounded clearly. Useful specialist roles include:

- architecture;
- database;
- security;
- testing;
- performance;
- UI/UX;
- code review;
- documentation.

Parallel work is allowed only when tasks do not modify the same files, shared state, migration sequence, or unresolved architectural decision.

Never dispatch two agents to independently "solve" the same implementation and merge whichever looks better. Define ownership first.

## Implementation rules

- Prefer the smallest change that fully solves the requirement.
- Reuse existing abstractions when they are healthy.
- Do not introduce abstractions with a single speculative use case.
- Do not silently replace a working subsystem because another stack is more familiar.
- Do not weaken validation, tests, types, lint rules, or security controls to make a build pass.
- Do not swallow errors.
- Avoid dead code and compatibility shims without a concrete consumer.
- Keep destructive operations explicit and reversible when possible.
- Treat migrations and production data changes as high-risk operations.

## Bug-fix protocol

Before fixing a bug:

1. reproduce it or establish a reliable failing signal;
2. identify the failing layer;
3. find the root cause, not only the visible symptom;
4. implement the narrowest fix;
5. add or update a regression test when feasible;
6. verify the original failure no longer occurs;
7. verify adjacent behavior still works.

Do not claim a bug is fixed solely because the changed code looks correct.

## UI/UX protocol

For visual changes:

- inspect the real rendered UI when tooling permits;
- test relevant viewport sizes and responsive behavior;
- verify loading, empty, error, disabled, hover/focus, and long-content states when applicable;
- preserve accessibility semantics;
- compare the final screen against the requested behavior, not only the component code.

A successful frontend build is not visual acceptance.

## Quality gates

Discover and use the project's real commands. Typical gates are:

1. formatter/check;
2. lint;
3. typecheck;
4. unit tests;
5. integration tests;
6. production build;
7. E2E or smoke tests when applicable.

Report each gate as `PASS`, `FAIL`, or `NOT RUN`, with a reason for anything not run.

Warnings are not equivalent to errors, but they must not be hidden or misreported.

## Review

For significant work, separate implementation from review. Review the final diff for:

- correctness;
- regressions;
- security;
- data integrity;
- error handling;
- unnecessary complexity;
- missing tests;
- stale documentation.

If a reviewer finds a blocking issue, implementation returns to active state until revalidated.

## Production and release

Before a production release, verify:

- configuration and secrets expectations;
- migrations and rollback path;
- build artifact;
- environment-specific assumptions;
- health/smoke checks;
- observability and error reporting;
- user-visible critical paths.

Never use production as the first meaningful test if a safer validation path exists.

## Persistent project memory

Important context belongs in repository files, not only chat history.

Use or maintain these files when applicable:

- `PROJECT.md` — goals, scope, constraints;
- `ARCHITECTURE.md` — current design and invariants;
- `DECISIONS.md` — important decisions and trade-offs;
- `TODO.md` — open work and known follow-ups;
- `AGENTS.md` — agent operating rules.

Record durable facts. Do not turn these files into session transcripts.

## Completion format

A completion report for non-trivial work should state:

- what changed;
- what was verified;
- quality-gate results;
- remaining risks or limitations;
- follow-up work, if any.

Never use "done" as a substitute for evidence.
