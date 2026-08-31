# Prompt — corrigir bug

```text
Fix this bug using an evidence-first workflow.

Read the applicable repository instructions first.

Do not start by editing the suspected file.

1. Reproduce the failure or establish the strongest available failing signal.
2. Trace the behavior through the relevant layers.
3. Identify and explain the root cause.
4. Define the smallest safe fix and regression risk.
5. Implement the fix without unrelated refactors.
6. Add or update a regression test when feasible.
7. Re-run the original reproduction.
8. Run adjacent tests and all applicable quality gates.

If the issue is visual, inspect the rendered UI after the fix.
If the issue depends on an external system, separate what was verified locally from what requires that system.

Final report:
- symptom;
- root cause;
- fix;
- regression coverage;
- gate results;
- residual risk.

Do not say "fixed" unless the failing signal is gone or you clearly label the result as partial/unverified.
```
