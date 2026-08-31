# Prompt — construir projeto novo

```text
Build this project as a working, verifiable system, not as a static prototype.

Start by reading AGENTS.md and the project documentation.

Before selecting architecture, convert the product request into:
- users and jobs to be done;
- MVP scope;
- explicit non-goals;
- constraints;
- observable acceptance criteria.

Choose the simplest architecture that satisfies the current requirements. Avoid speculative microservices, queues, databases, abstractions or dependencies.

Implement in vertical slices. Each slice should connect enough of the real system to prove behavior end to end.

For every significant milestone:
1. implement;
2. run the relevant checks;
3. demonstrate the behavior;
4. fix failures before expanding scope.

Before completion run all applicable quality gates: formatting/lint, typecheck, tests, production build, and smoke/E2E validation.

For UI, inspect the rendered result at representative viewport sizes.

Keep PROJECT.md, ARCHITECTURE.md, DECISIONS.md and TODO.md updated only with durable information.

Do not call the project complete because the code exists. Completion requires evidence against the acceptance criteria.
```
