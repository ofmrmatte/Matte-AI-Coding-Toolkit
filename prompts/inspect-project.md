# Prompt — inspecionar projeto existente

Use antes de mudanças relevantes em um repositório que você ainda não conhece bem.

```text
Inspect this repository before making changes.

Read all applicable AGENTS.md/instruction files first.

Your goal is to build a factual map of the current system, not to propose a rewrite.

Determine:
1. stack, versions and package/build tooling;
2. entry points and major modules;
3. current architecture and data flow;
4. persistence and external integrations;
5. existing test, lint, typecheck and build commands;
6. the implementation path related to my request;
7. invariants and compatibility constraints;
8. likely regression risks;
9. missing information that cannot be resolved from the repository.

Then report:
- current behavior;
- relevant file/module map;
- smallest plausible change surface;
- concrete acceptance criteria for the requested change;
- validation plan.

Do not implement until the inspection is complete unless the requested change is trivial and isolated.
```
