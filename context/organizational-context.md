# Organizational Context

## Purpose and evidence boundary

This file captures the context needed to apply the toolkit to the Reliance Digital store-operations portal case study. It is not an official corporate policy, organization chart, product strategy, or statement of Reliance Retail controls. Only facts explicitly present in the inspected project are treated as confirmed.

## Confirmed case-study context

- The project README describes a starter repository for a Reliance Digital store-operations portal.
- The application has a FastAPI backend and React/Vite frontend.
- Current user-visible functionality includes product listing, product lookup, product-name search, low-stock results, and login/session endpoints.
- Product data is held in memory in the backend service. The LMS database script is a separate sample and the README says the application is not connected to it.
- The repository has project-level Copilot instructions, an analysis-only Project Analyst, a read-only Review Agent, a project analyst plan, and a code-review skill.
- The stated case-study need is consistent AI-assisted changes aligned with repository conventions, quality practices, and safe-change boundaries.

## Working assumptions to validate

These are planning assumptions, not verified organizational facts:

- Store operations staff and administrators are plausible users; confirm roles and permissions with the business owner.
- Inventory accuracy, availability, access control, and clear recovery from errors are likely important; establish measurable service and operational targets before treating them as acceptance criteria.
- Data classification, retention, privacy, audit, and regulatory requirements are not defined by the inspected starter repository and require accountable-owner review.
- The intended delivery team, environments, deployment platform, support ownership, and production approval process are unknown.

## Decision owners

Assign named owners in the adopting project before production work:

| Decision | Accountable owner to identify |
| --- | --- |
| Business outcomes, workflow, and acceptance | Product/business owner |
| Architecture and technical constraints | Technical lead/architect |
| Data handling and security risk acceptance | Security/privacy owner |
| Release authorization and rollback readiness | Service/release owner |
| AI-assisted changes and repository policy | Repository maintainer |

An agent may prepare evidence or recommendations, but it does not become an approver or decision owner.

## Scope and guardrails

- Treat each repository as authoritative for its own implementation; do not copy this case study's technology assumptions into unrelated projects.
- Do not infer access rules, inventory policies, customer data flows, or production integrations from sample data or UI labels.
- Keep changes proportionate to the approved requirement and preserve unrelated business behavior.
- Do not use real credentials, customer records, or production data in prompts, examples, validation fixtures, or exported bundles.
- Record uncertainties and obtain human decisions where they change behavior, data handling, or release risk.
