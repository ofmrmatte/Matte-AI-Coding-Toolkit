# Decisions — Taskboard

This file records decisions that are easy to lose when looking only at the current code.

## 2026-08-31 — Keep the application as a modular monolith

**Decision**

Keep UI, server logic and persistence in one Next.js application for the first release.

**Why**

The team is small, the traffic is low and the current workflows do not need independent scaling. Splitting the application would add deployment and debugging overhead without solving a present problem.

**Revisit when**

A module needs independent scaling, deployment ownership or a runtime that the main application cannot provide.

## 2026-08-31 — PostgreSQL remains the source of truth

**Decision**

Do not add a cache for task state in the initial version.

**Why**

The dataset is small and reads are simple. A second state store would create invalidation work before there is evidence of a performance problem.

**Revisit when**

Production measurements show database reads are a material bottleneck.

## 2026-08-31 — No optimistic status updates yet

**Decision**

Wait for the server mutation to succeed before showing a task as moved to another status.

**Why**

Status changes are operationally relevant and failed optimistic updates create misleading UI. The current latency is acceptable.

**Revisit when**

The interaction becomes noticeably slow and rollback behavior is covered by tests.
