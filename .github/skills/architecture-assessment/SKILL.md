---
name: architecture-assessment
description: Assess the smallest relevant architecture slice and propose a design that respects existing owners and boundaries.
---

# Architecture Assessment

Use for cross-layer changes, new interfaces, persistence, material dependencies, or unclear ownership.

## Procedure

1. Read the relevant repository architecture guidance and implementation.
2. Trace the existing request/data flow through only affected layers.
3. Locate services, models, API clients, components, helpers, or patterns that already own the behavior.
4. Describe current state with evidence; label the future design as proposed.
5. Identify contracts, compatibility, data migration, security/privacy, testing, deployment, and support impact as relevant.
6. Recommend the simplest design that meets approved criteria; explain only material alternatives.
7. List decisions and risks that require accountable human owners.

## Boundaries

- Avoid abstraction for its own sake and avoid duplicating an existing owner.
- Do not present inferred architecture as verified fact.
- Do not edit files during assessment.
