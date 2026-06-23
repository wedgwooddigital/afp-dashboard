# Model Guide — Working Safely In Client Ops

This guide is for lower-cost or less capable models working in a client ops repo created from this template.

## First Steps

1. Read `AGENTS.md`.
2. Read `company/facts.yaml` — note `website.brand_source`.
3. Read `company/content-policy.md`.
4. Check `tasks.md`.
5. Route the task to the correct folder before editing.

If you are unsure whether a task belongs in ops or the website repo, stop and ask. When `brand_source: ops_local`, there may be no website repo — work stays in ops unless explicitly migrating to a new site build.

## Routing Rules

| Work type | Folder | Notes |
|-----------|--------|-------|
| IT inventory, runbooks, support notes | `it/` | No passwords or private access detail |
| SEO strategy, GBP, reviews | `seo/` | Website implementation needs approval |
| Marketing campaigns, analytics, local ads | `marketing/` | Broader than SEO/social |
| Social drafts and exports | `social/` | Publishing is approval-led |
| Photography, video, design | `creative/` | Do not duplicate canonical brand assets (sibling mode) |
| Billing and time logs | `billing/` | Keep non-billable detail internal |
| Long client-facing dashboard documents | `content/documents/` | Must be reviewed before `clientVisible: true` |
| Short client-facing dashboard updates | `content/updates/` | Must be reviewed before `clientVisible: true` |
| Raw safe inputs | `reference/` | Distill useful findings elsewhere |
| Raw tool output | `research/` | Gitignored; do not rely on it as canonical |
| Sensitive notes | `local/` | Gitignored; never publish |
| Brand docs (ops_local) | `company/brand/` | Canonical when `brand_source: ops_local` |

## Safe Everyday Tasks

Lower-cost models can usually do these:

- Add internal notes to the correct domain folder.
- Draft social copy in `social/drafts/`.
- Summarise raw research into a domain note.
- Update task checklists.
- Add draft reports or updates with `clientVisible: false`.
- Reformat markdown without changing meaning.
- Add non-sensitive runbook steps.
- Build the dashboard locally to check for syntax errors.
- Fill in `company/brand/` stubs when `brand_source: ops_local`.

## Human Review Required

Ask before doing these:

- Setting `clientVisible: true` on a report or update.
- Publishing, deploying, or sharing a dashboard URL/password.
- Adding billing totals to client-facing content.
- Mentioning rates, invoice totals, or expenses in client-facing reports.
- Changing approval workflows.
- Adding client names, staff details, phone numbers, or operational access notes.
- Moving content between internal folders and `content/`.
- Creating or changing Git remotes.
- Creating commits if the change includes client-visible content.

## Use A Higher-Capability Model

Escalate to GPT-5.5, Opus, or another high-capability model for:

- Major repo structure changes or template changes.
- Dashboard/auth/security changes.
- Netlify, GitHub Actions, CI, dependency, or deployment architecture.
- Any Git push, deploy, or go-live decision.
- Website-repo changes or public website SEO implementation.
- Billing logic, non-billable filtering, or invoice-sensitive reporting.
- Security/privacy reviews, secrets handling, or access-control decisions.
- Large dashboard documents, adversarial reviews, or strategic recommendations.
- Cross-repo asset and brand-system changes.
- Migrating from `ops_local` to `sibling_repo` (see `company/MIGRATION-sibling-repo.md`).

## Hard Safety Rules

- Never put secrets in git.
- Never edit or deploy the public website from this repo (unless implementing approved changes on an external platform — still not from ops deploy tooling).
- Never publish client dashboard content by default. `clientVisible: true` is an approval decision.
- Never include non-billable hours or amounts in client-visible content unless explicitly requested.
- Never run `git push` or deploy unless explicitly requested.
- When `brand_source: sibling_repo`, never copy canonical logo/photo/brand source files into ops as the source of truth.
- When `brand_source: ops_local`, canonical brand files belong in `company/brand/assets/` — do not treat `social/` as the source of truth.
- Never treat Netlify password protection as strong per-user authentication.

## When In Doubt

Make a draft with `clientVisible: false`, explain the uncertainty, and ask for review.
