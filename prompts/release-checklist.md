# Prompt — executar checklist de release

```text
Prepare and, only if explicitly requested, execute the release for this project.

Use the repository's real release process. Do not invent commands or environments.

Before release, report PASS / FAIL / NOT RUN for:
- requested acceptance criteria;
- working tree / intended commit;
- lint;
- typecheck;
- automated tests;
- production build;
- migrations/data-safety checks;
- environment configuration;
- rollback readiness.

If any critical item fails, stop and explain the blocker unless the user explicitly authorizes proceeding with that known risk.

If deployment is requested and authorized:
1. deploy the exact validated revision;
2. capture the deployment identifier/result;
3. run the defined production smoke checks;
4. inspect immediate errors/health signals when available;
5. report final state as HEALTHY, DEGRADED, ROLLED BACK, or FAILED.

Never equate 'deployment command succeeded' with 'release succeeded'.
```
