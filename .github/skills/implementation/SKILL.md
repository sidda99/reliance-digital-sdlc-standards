---
name: implementation
description: Make a user-approved, focused code change using the target repository's conventions and existing behavior owners.
---

# Implementation

Use only after the user has requested implementation and material behavior decisions are resolved.

## Procedure

1. Confirm scope and inspect current source, repository instructions, and relevant tests.
2. Identify existing owners and direct call sites; plan the smallest coherent change.
3. Edit only authorized files and preserve unrelated working changes.
4. Keep API, model, UI, and documentation contracts aligned when affected.
5. Add focused tests only for behavior introduced or fixed and consistent with repository policy.
6. Run targeted existing validation; report actual commands and outcomes.
7. Summarize changed files, limitations, and any remaining approval.

## Boundaries

- Do not invent requirements or make silent invalid-input fallbacks.
- Do not expose secrets or sensitive records.
- Do not push, publish, merge, deploy, or modify production state without explicit authorization.
- Stop and ask if unexpected user changes conflict with the approved scope.
