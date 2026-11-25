# Reliance Digital Portal: SDLC Level 3 Gap Assessment

**Assessment date:** 2026-11-25
**Scope:** Read-only inspection of the adjacent `reliance-digital-store-portal` starter project. This is a documentation/guidance baseline, not a production audit, security assessment, or judgment of the project team.

## Summary

The starter already provides useful repository-level conventions, business-flow context, a bounded analysis agent, and a read-only reviewer/skill. It does not show evidence for several Level 3 delivery controls, especially an end-to-end, repeatable CI/release path, front-end automated verification, architecture/decision records, and explicit release/operations evidence. Absence from the inspected files is recorded as **not evidenced**, not proof that a practice does not exist elsewhere.

## Evidence map

| Level 3 area | Observed project evidence | Gap against proposed standard | Suggested next step |
| --- | --- | --- | --- |
| Intake and repository context | Root README describes the case study, stack, features, run commands, and AI-assisted consistency goal. `.github/agents/project-analyst-plan.md` sets analysis scope and output. | No generic issue/acceptance-criteria template or visible traceability convention in inspected files. | Add a lightweight work-item template if the team uses GitHub issues/PRs; require observable acceptance criteria and explicit open decisions. |
| Requirements and business rules | Analyst plan records product behavior and insists on source verification; backend routes/services/models implement the product flow. | Requirements are currently project-specific and not tied to durable change/release evidence. | Preserve the analyst's confirmed-vs-assumed distinction and link accepted criteria to implementation and verification. |
| Architecture/design | `.github/copilot-instructions.md` documents backend/frontend ownership and alignment points. Existing API client and service boundaries are identifiable. | No architecture decision record or material-change review standard was found in the inspected tree. | Use concise decision records for material API, persistence, authentication, or deployment choices. |
| Implementation conventions | Copilot instructions define API ownership, query encoding, model validation, fetch boundaries, and UI conventions. | No visible contribution/PR process or change-size/review boundary documented. | Add a PR checklist tied to this toolkit if repository maintainers approve. |
| Backend verification | `backend/tests/test_products.py` uses FastAPI `TestClient` and covers health, product list/search/not-found/low-stock, login, and token/logout paths. Backend pytest commands are documented. | Inspected tests provide useful HTTP-boundary checks, but no CI configuration was found in the inspected tree. Broader lifecycle/coverage targets are unspecified. | Establish a CI job for documented backend checks and define additional cases from approved requirements as features evolve. |
| Frontend verification | `frontend/package.json` defines Vite dev/build/preview commands; project instructions state there is no frontend test runner or lint script. | Automated frontend behavioral checks and lint/type checks are not evidenced. | Decide proportionate frontend checks and document/run them consistently; avoid adding tooling without an agreed need. |
| Security/privacy and data | `backend/app/services/auth_service.py` contains a demo user/password and in-memory SHA-256 password hashing and token state. The portal README describes LMS sample data and read-only database access for a separate MCP connection. | Starter/demo authentication is not evidence of production-ready credential storage, token lifecycle, authorization, or data governance. No production data classification or security review evidence was found. | Explicitly label demo boundaries; require a security/privacy owner and approved design before production authentication, persistent data, or sensitive data use. |
| Persistence and integrations | README and `product_service.py` show product data is in memory. README says the LMS sample database is not connected to the application. | Durability, data ownership, backup/recovery, and integration behavior are not defined for the starter. | Treat database/integration adoption as a separate approved architecture and operational decision, not an assumed existing feature. |
| Independent review | `.github/agents/review-agent.agent.md` is read-only and references `.github/skills/code-review/SKILL.md`; the review instruction asks for reuse assessment. | Review guidance is present, but no required PR approval or branch-protection evidence was available. | Configure repository protections and require human review if/when the project is hosted and team policy calls for it. |
| Release and operations | README includes local backend/frontend startup commands. | No deployment workflow, environment strategy, release approval, monitoring, rollback, or support runbook was found in the inspected tree. | Define these before production use; keep deployment disabled until owners, checks, and rollback are agreed. |
| Continuous improvement | Existing analyst/reviewer configurations encode useful practices. | No post-release learning, incident feedback, exception register, or maturity review process was evidenced. | Track material exceptions and revisit lifecycle guidance after meaningful delivery feedback. |

## Prioritized adoption sequence

1. **Set ownership and scope:** confirm business, technical, security/privacy, and release decision owners; decide whether this remains a teaching/demo starter or targets production.
2. **Make verification repeatable:** add an approved CI workflow for current backend tests and frontend build; agree additional checks based on risk and maintainability.
3. **Record design and acceptance evidence:** introduce concise acceptance criteria, decision records for material changes, and a PR review checklist.
4. **Clarify security and operations before production:** treat demo authentication, in-memory state, data governance, deployment, monitoring, and rollback as explicit decisions.
5. **Review adoption:** periodically assess whether the lifecycle evidence is used and improve it based on delivery experience.

## Limits

- The assessment covers the local file snapshot available on 2026-11-25; no deployment platform, CI settings, issue history, branch rules, or production environment was inspected.
- Findings state what was or was not evidenced in the inspected files. They are not claims of control failure or a formal risk rating.
- Security observations are limited to visible demo implementation context and are not an exploitability assessment.
- Reassess source files and external controls before using this as an operational gap register.
