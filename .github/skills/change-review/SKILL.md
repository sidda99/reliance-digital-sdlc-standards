---
name: change-review
description: Review an available change set for substantiated behavior defects, architecture fit, verification, documentation, and reuse.
---

# Change Review

Use for read-only review of a concrete diff or supplied change set.

## Procedure

1. Establish scope and read the diff; state if no diff is available.
2. Read the closest implementation, callers, models, tests, and documentation.
3. Trace normal and meaningful edge/error behavior for changed paths.
4. Search for existing owners and established helpers; report reuse concerns only when drift or duplicated responsibility is evidenced.
5. Check directly related test coverage, documentation, and configuration consistency.
6. Reread candidate findings and discard speculation, style-only observations, and issues without an affected path.

## Output

Put actionable findings first, ordered by severity. Each finding states impact, evidence, and a focused remedy. Then summarize relevant architecture, tests/docs, reuse, and evidence limits. If no actionable findings exist, say so.

## Boundaries

- Do not edit files or claim checks ran unless they were actually executed.
- Do not infer requirements or runtime agent/skill loading from configuration alone.
- Route requests for an exploitability assessment through an approved security-review process.
