# SDLC Level 3: Defined and Repeatable Delivery

## Meaning and applicability

For this toolkit, Level 3 means the organization has a documented, repeatable delivery lifecycle that teams apply and tailor consistently. It is a proposed internal maturity profile, not a standardized external rating, audit result, or regulatory certification.

Use the controls proportionately. A small change may use a short decision record and focused validation; a high-impact change needs deeper analysis and evidence. A project may not waive accountable approvals or applicable law and policy.

## Lifecycle and minimum evidence

| Stage | Required practice | Evidence appropriate to risk |
| --- | --- | --- |
| 1. Intake | Identify the user/business outcome, scope, stakeholders, constraints, and success measure. Separate confirmed facts from assumptions. | Approved issue/story, outcome, scope, acceptance criteria, open decisions. |
| 2. Analysis | Trace current behavior and affected boundaries. Identify data, authorization, privacy, accessibility, dependency, and operational implications. | Requirements and impact notes with evidence/source references. |
| 3. Design | Reuse existing owners and patterns. Explain material design decisions and interface/data changes before implementation. | Lightweight design/decision record, API/data contract changes, alternatives where relevant. |
| 4. Implementation | Make focused, reviewable changes. Follow repository conventions; do not silently broaden scope. Keep secrets and sensitive data out of source, logs, prompts, and artifacts. | Linked change set, understandable commits/PR, reviewable implementation. |
| 5. Verification | Run relevant automated checks and inspect meaningful failure paths. Report commands and outcomes truthfully. | CI/check results, focused test evidence, unresolved failures and rationale. |
| 6. Review | Obtain independent review proportionate to impact. Review behavior, architecture, security/privacy implications, documentation, and rollback considerations. | Review record and disposition of material findings. |
| 7. Release | Require an authorized human release decision; confirm configuration, migration/backout, monitoring, and support readiness. | Release approval, deployment/rollback plan, operational owner. |
| 8. Learn | Observe outcomes and incidents; update standards, runbooks, and backlog based on evidence. | Post-release observation, incident/feedback actions, updated records. |

## Cross-cutting controls

### Requirements and traceability

- Acceptance criteria describe observable outcomes, boundaries, and important error cases.
- Link requirement, design decision, code change, verification, and release evidence when the repository's workflow supports it.
- Mark decisions as confirmed, proposed, or unresolved. Never present an agent inference as an approved business rule.

### Architecture and maintainability

- Preserve clear ownership at UI, API, service, and data boundaries.
- Search for existing APIs, services, models, helpers, and UI components before adding parallel behavior.
- Document material dependencies, contracts, data changes, and operational consequences.
- Favor small changes that can be reviewed and safely reverted.

### Security, privacy, and safety

- Apply least privilege, validate inputs at the owning boundary, and avoid exposing secrets or sensitive data.
- Identify authentication/authorization, data classification, retention, logging, dependency, and deployment implications relevant to the change.
- Use approved scanning and review processes where available; do not claim a scan or security review ran unless it did.
- High-risk decisions and exceptions require accountable human review and a recorded rationale.

### Quality and operations

- Define test/verification strategy from the change's observable behavior and risk.
- Automate repeatable checks in CI when repository tooling supports them; preserve clear local reproduction steps.
- Include monitoring, support, migration, and rollback needs when relevant to the change.
- Do not make production changes or trigger deployment without explicit authorization.

### AI-assisted delivery

- Inspect the current repository evidence before proposing or changing code.
- Use agents as bounded assistants: analyst gathers evidence, architect frames trade-offs, implementer makes approved focused changes, quality specialist validates, reviewer reports independent findings.
- The coordinator tracks dependencies and handoffs; it must not claim specialist work, tests, approvals, or release actions that did not occur.
- Humans own business decisions, security/privacy risk acceptance, code approval, and production release.
- Avoid sending secrets, personal data, or confidential material to unapproved services.

## Tailoring and exceptions

1. Record which controls apply and why any evidence is reduced for a low-risk change.
2. Do not waive applicable legal, contractual, security, privacy, or organizational obligations.
3. For an exception, name the accountable approver, rationale, risk, compensating control, and expiry/revisit date.
4. Reassess the exception when scope, data, dependencies, or threat context changes.

## Level 3 adoption indicators

Use these as evidence of adoption, not as a scorecard that substitutes for judgment:

- Teams can locate current lifecycle guidance and repository-specific conventions.
- Work items normally include outcomes, acceptance criteria, and impact analysis proportionate to risk.
- Design, implementation, verification, independent review, and release decisions have identifiable evidence.
- Repositories run documented checks consistently and surface failures rather than masking them.
- Exceptions and unresolved material risks have owners and review dates.
- Feedback from releases and incidents produces tracked improvements.
