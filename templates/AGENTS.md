# AGENTS.md

> Adapt this file to the repository. Remove rules that do not apply and replace placeholder commands with the project's real commands.

## Mission

Deliver verified changes with the smallest safe implementation that satisfies the requested behavior.

## Project commands

```text
Install: <command>
Dev: <command>
Lint: <command>
Typecheck: <command>
Test: <command>
Build: <command>
E2E/Smoke: <command>
```

Never report a gate as passed unless its real command was executed successfully.

## Before editing

- Read relevant documentation and instructions.
- Inspect the current implementation.
- Identify invariants and integration boundaries.
- Define observable acceptance criteria for non-trivial work.
- Preserve existing working behavior outside the requested scope.

## Implementation

- Prefer the smallest complete solution.
- Reuse healthy existing patterns.
- Do not weaken validation or tests to make checks pass.
- Avoid speculative abstractions.
- Keep destructive changes explicit and reversible when possible.

## Bugs

Reproduce or establish a reliable failing signal before fixing. Validate the original failure after the change and add regression coverage when feasible.

## UI

When UI changes, inspect the rendered result and test relevant viewports/states. A successful build is not visual acceptance.

## Production

Do not deploy unless the task includes deployment. Before production changes, verify target environment, migration impact, rollback and smoke checks.

## Completion

For non-trivial work report:

- changes made;
- validation performed;
- PASS/FAIL/NOT RUN quality gates;
- known limitations or risks.

Code written is not success. Verified behavior is success.
