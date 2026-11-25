# Reliance Digital SDLC Level 3 Toolkit

A reusable, repository-portable toolkit for applying a defined software delivery lifecycle to Reliance Digital-related projects. It includes organizational context, GitHub Copilot instructions, coordinating and specialist agents, reusable skills, a project gap assessment, and guarded PowerShell distribution scripts.

> **Status:** Proposed internal working standard for this case study. "Level 3" is defined by this toolkit as a repeatable, documented, team-wide lifecycle; it is not an external certification or a claim about Reliance Retail policy.

## What is included

| Area | Contents |
| --- | --- |
| Organizational context | `context/organizational-context.md` records confirmed case-study context, assumptions, and boundaries. |
| Delivery standard | `standards/sdlc-level-3.md` defines lifecycle expectations and evidence. |
| Project assessment | `standards/project-gap-assessment.md` maps the inspected store portal against the proposed standard. |
| Copilot setup | `.github/copilot-instructions.md` provides portable repository-level guidance. |
| Agents | `.github/agents/` contains a coordinator and requirements, architecture, implementation, quality, and review specialists. |
| Skills | `.github/skills/` contains reusable requirement, architecture, implementation, quality, and review workflows. |
| Safe distribution | `scripts/Validate-Toolkit.ps1` checks toolkit structure; `scripts/Export-ToolkitBundle.ps1` exports an allowlisted bundle without overwriting existing files. |

## Use in a project

1. Review `context/organizational-context.md` and correct assumptions with the accountable project owner.
2. Read `standards/sdlc-level-3.md`; tailor its evidence requirements to the project's risk, regulatory obligations, and delivery model.
3. Use the gap assessment as a baseline, not as a release decision. Reassess the target repository directly before adopting actions.
4. Copy or export only the repository instructions and agents/skills that the target team accepts.
5. Keep business decisions, approvals, security risk acceptance, and production release authority with accountable humans.

To validate this repository from PowerShell:

```powershell
.\scripts\Validate-Toolkit.ps1
```

To preview a clean bundle location before creating it:

```powershell
.\scripts\Export-ToolkitBundle.ps1 -Destination C:\work\reliance-sdlc-bundle -WhatIf
```

Export only after reviewing the destination and file list:

```powershell
.\scripts\Export-ToolkitBundle.ps1 -Destination C:\work\reliance-sdlc-bundle
```

The export script requires a new or empty destination, uses a fixed file allowlist, and does not commit, push, create GitHub resources, or modify source application files.

## Case-study evidence

The baseline was inspected from the adjacent `reliance-digital-store-portal` project on 2026-11-25. Relevant evidence includes its README, `.github/copilot-instructions.md`, analyst and reviewer agent files, `backend/app/`, `backend/tests/test_products.py`, `frontend/`, and `database/lms_setup.sql`. See the gap assessment for evidence, limits, and recommendations.

## Publication boundary

This toolkit is prepared locally in the `sidda99/reliance-digital-sdlc-standards` repository clone. No commit, push, pull request, or remote file update is performed without explicit approval.
