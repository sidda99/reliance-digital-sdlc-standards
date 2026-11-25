---
name: requirements-analysis
description: Analyze a requested business outcome against current repository evidence and produce scoped acceptance criteria and open decisions.
---

# Requirements Analysis

Use when preparing a change, clarifying expected behavior, or assessing a feature request.

## Procedure

1. Restate the outcome, user need, boundaries, and explicit constraints.
2. Inspect relevant project docs and trace current behavior only through affected components.
3. Record evidence with file paths and symbols; distinguish confirmed behavior from assumptions and proposals.
4. Identify actors only when supported by evidence or user context.
5. Describe inputs, outputs, state changes, business rules, permissions, data implications, and meaningful error/alternate paths.
6. Write observable acceptance criteria and list unresolved decisions and accountable owners.
7. Recommend a validation approach based on existing commands and behavior.

## Boundaries

- Do not infer product policy, roles, integrations, or persistence from names or examples.
- Do not edit code or tests in an analysis assignment.
- Keep tests as read-only evidence unless the user explicitly authorizes test changes.
- Ask a focused question when an unresolved choice changes behavior, scope, or risk; otherwise state a bounded assumption.
