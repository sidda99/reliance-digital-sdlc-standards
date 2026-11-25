# Repository-wide Copilot Instructions

## Purpose

Apply the proposed SDLC Level 3 practices documented in `standards/sdlc-level-3.md`. This repository is a reusable toolkit: do not assume every adopting project shares the Reliance Digital case study's stack or domain.

## Before acting

- Inspect the target repository's current documentation, relevant source, configuration, and tests before recommending or changing behavior.
- Restate the requested outcome and identify confirmed facts, assumptions, decisions, risks, and acceptance criteria.
- Trace changes through the existing owners and boundaries. Search for reusable services, APIs, models, components, and skills before introducing new ones.
- Keep the requested scope focused. Do not modify business code, tests, documentation, or deployment settings unless the user asks for that work.

## Implementation and validation

- Follow the target repository's language, formatting, architecture, and command conventions.
- Make small, reviewable changes; preserve unrelated behavior and user changes.
- Add or change tests only for behavior introduced or fixed, when permitted by the request and repository policy.
- Run the smallest relevant existing validation first. State commands, outcomes, and any checks not run truthfully.
- Surface failures and unresolved decisions; do not silently skip checks or claim success without evidence.

## Safety and approvals

- Never include secrets, credentials, personal data, or private production information in source, prompts, logs, fixtures, or exported artifacts.
- Treat sample credentials and sample records as non-production examples; do not generalize them into production practice.
- Do not make destructive repository changes, change permissions, publish, push, merge, or deploy unless the user explicitly authorizes that exact action.
- Human owners retain authority over business rules, security/privacy risk acceptance, review approval, and release decisions.

## Toolkit-specific scope

- The `context/` and `standards/` documents are proposed guidance. Resolve assumptions with project owners before treating them as policy.
- The gap assessment is evidence-limited and must not be presented as an audit or certification.
- Distribution scripts use an explicit allowlist and should fail safely on conflicting or unsafe destinations.
