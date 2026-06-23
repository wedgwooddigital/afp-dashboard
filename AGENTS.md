# Agent Instructions — Air Fryer Probe Dashboard

Operational workspace for **Air Fryer Probe** (Ben Cribb). Graphic design client — live site on Shopify (not built by us). Use this repo for creative production, social, marketing pitches, billing, and the password-protected **client dashboard**.

**Brand source:** `ops_local` — canonical brand in `company/brand/`. Live site [airfryerprobe.com](https://airfryerprobe.com) is reference only.

## Quick start

1. Read `company/facts.yaml` — especially `website.brand_source: ops_local`.
2. Read `tasks.md`.
3. Read `company/content-policy.md` before using `reference/` material.
4. **Visual identity** → `company/brand/design.md`
5. **Brand facts (price, specs, banned words)** → `company/brand-facts.yaml`
6. **Voice** → `company/brand/voice.md`
7. **Product** → `company/product.md`
8. **AI generation** → `creative/generation-workflow.md`, then `creative/image-prompts.md` and `social/templates.md`
9. **Assets** → `social/assets-manifest.md` · resolve via `./scripts/resolve-website-asset.sh`

## Hard rules

- **Logo:** Never retype "AIR FRYER". Use SVG from `company/brand/assets/logos/` — `artboard-2.svg`, `artboard-2-on-dark.svg`, `artboard-2-reverse.svg`, `artboard-2-icon.svg`. See `company/brand/design.md` § Logo Usage.
- **Colours:** Dark Navy `#11151C` default background. Brand Orange `#FD9E27` for CTAs/headings only.
- **Temperatures:** `company/temperature-guide.md` + `company/brand/assets/images/graphics/air-fryer-chart-final-preview.png`. Chicken = **74°C**. No carry-over offsets.
- **Bundle:** Market 3-in-1 (probe + guide + hook). Mini screwdriver is in-the-box only — `company/product.md`.
- **Voice:** Confident, direct. No *revolutionary* or *game-changing* in brand copy (OK in customer quotes). *Ultimate* is allowed.
- **Follower counts:** Never cite in new copy. Theme footer “300k Followers” is wrong.
- **No public website deploys** from this repo. Shopify changes proposed here, implemented after approval.
- **No secrets in git** — use `local/` for sensitive notes.

## Content policy (short)

**Canonical:** `company/brand/` · `company/` · `creative/` · `social/` · `social/assets-manifest.md`

**Reference only:** `reference/site-content/` · `reference/facebook-posts/` — rewrite before publishing.

If reference conflicts with canonical → **canonical wins.** Full policy: `company/content-policy.md`.

## Repository map

```text
company/
  facts.yaml              Ops routing, contacts, scope
  brand-facts.yaml        Price, specs, bundle, banned words
  brand/                  Design, voice, branding, assets
  product.md, overview.md, audience.md, goals.md, …
creative/                 Generation workflow, image prompts
social/                   Templates, drafts, output, assets-manifest
marketing/                Campaigns, pitch proposals
content/documents/        Client dashboard documents
dashboard/                Astro client dashboard build
reference/                Site scrape, Facebook archive, client notes
research/                 Gitignored tool output
local/                    Gitignored sensitive notes
```

## Task routing

| Task | Start here |
|------|------------|
| Any task | `company/facts.yaml`, `tasks.md` |
| Route AI asset | `creative/generation-workflow.md` |
| Product image | `creative/image-prompts.md`, `company/product.md`, `company/brand/design.md` |
| Social post with text | `creative/generation-workflow.md`, `social/templates.md`, `company/brand/voice.md` |
| Caption-only post | `social/assets-manifest.md`, `company/brand/voice.md` |
| Temperature tip | `company/temperature-guide.md`, `social/templates.md` |
| Ad copy / caption | `company/brand/voice.md`, `company/audience.md` |
| Founder credentials | `company/trust-and-proof.md`, `company/brand-facts.yaml` |
| Match published FB voice | `reference/facebook-posts/` — rewrite to canonical |
| Website redesign pitch | `reference/site-content/`, `reference/CLIENT-SITE-NOTES.md` |
| Client dashboard page | `content/documents/` → `dashboard/` build |
| Brand asset path | `./scripts/resolve-website-asset.sh logos/artboard-2.svg` |
| Billing / quote | `billing/`, `company/facts.yaml` |

## Client dashboard pipeline

1. Add markdown to `content/documents/` or `content/updates/`
2. Set `clientVisible: true` only when ready for Ben
3. `cd dashboard && npm run build`
4. Deploy `afp-dashboard.netlify.app` with password protection

## Out of scope

Website deployment, Shopify admin, domain/DNS — unless explicitly requested.
