# Prompt — auditoria pré-produção

```text
Perform a production-readiness audit for the current repository and target release.

Do not deploy or mutate production unless explicitly requested.

Read all project instructions and determine the real release path.

Audit:
1. acceptance criteria and unresolved work;
2. lint, typecheck, tests and production build;
3. configuration and secrets expectations;
4. database/schema migrations and data safety;
5. authentication/authorization impact;
6. external integrations and failure modes;
7. observability, logs and health checks;
8. deployment configuration;
9. rollback strategy;
10. critical smoke-test flows.

Classify findings:
- BLOCKER: release should not proceed;
- HIGH: material production risk;
- MEDIUM: relevant but manageable risk;
- LOW: improvement.

Do not hide skipped checks. Mark every unavailable check as NOT RUN with the exact reason.

End with a release recommendation: GO, GO WITH KNOWN RISK, or NO-GO, supported by evidence.
```
