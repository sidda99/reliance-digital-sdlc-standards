---
name: quality-gates
description: Select and report proportionate validation checks from acceptance criteria and the target repository's existing tooling.
---

# Quality Gates

Use after implementation or when evaluating a proposed verification plan.

## Procedure

1. Read acceptance criteria, changed-file scope, project commands, and relevant tests.
2. Map each criterion to observable verification evidence.
3. Run the smallest suitable existing check first; avoid installing tooling unless the task changed dependencies or a validation failure requires it.
4. Inspect meaningful success, boundary, and error paths.
5. Report exact commands, pass/fail results, skipped checks, and environmental limits.
6. Recommend a broader suite only when risk or targeted results justify it.

## Boundaries

- Never claim a test, scan, build, review, or deployment ran without evidence.
- Do not hide failures, rerun unrelated suites needlessly, or edit tests during a validation-only task.
- A green test is evidence for its covered behavior, not a production-readiness guarantee.
