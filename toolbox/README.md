# Toolbox — ops source (client dashboard)

Markdown here syncs to `content/toolbox/` at build time via `./scripts/sync-dashboard-brand.sh`. The password-protected dashboard **Toolbox** nav reads from that generated folder — do not edit generated files by hand.

## What belongs here

| Folder / file | Dashboard |
|---------------|-----------|
| `facts.md` | Client-safe services, areas, USPs |
| `prompts/` | Copy-paste AI prompts (versioned) |
| `playbooks/` | Step-by-step how-to guides |
| `templates/` | Non-AI structures (posts, emails, GBP) |

**Voice** lives in `company/brand/voice.md` and syncs to Toolbox automatically.

## Frontmatter (required for prompts, playbooks, templates)

```yaml
---
title: Page title
description: Short summary for dashboard cards
kind: prompts          # prompts | playbooks | templates | reference
order: 10
clientVisible: true    # false = ops-only (tiers, internal prompts)
updated: 2026-06-23
changelog: "v1 — template example"
tier: all              # optional: all | diy | managed
videoUrl: null         # optional Loom/YouTube embed URL
---
```

## Visibility & tiers

- Set `clientVisible: false` for agency-only prompts — see `prompts/internal-strategy.md` (syncs but never publishes).
- Set `tier: diy | managed | all` on toolbox pages. Filter at build time via `company/facts.yaml` → `dashboard.tier`:
  - `all` — every `clientVisible` page (template default)
  - `diy` — pages with `tier: all` or `tier: diy`
  - `managed` — pages with `tier: all` or `tier: managed`

Example: `templates/review-replies.md` uses `tier: managed` — hidden when the client dashboard is configured as `diy`.

## Versioning

- Always set `updated` and `changelog` on prompts, playbooks, and templates.
- Dashboard toolbox pages show both in a **Last updated** panel above the content.

## See also

- [`dashboard/PLAN-brand-toolbox.md`](../dashboard/PLAN-brand-toolbox.md)
- [`dashboard/README.md`](../dashboard/README.md)
- [`content/toolbox/README.md`](../content/toolbox/README.md)
