# Air Fryer Probe — Project Goals

## Current phase: Client ops — creative production and pitches

This workspace is the **Air Fryer Probe ops repo** — brand kit, creative workflows, pitch pipeline, and client dashboard. Graphic design client (Ben Cribb); live Shopify site is reference only.

### Primary objective

Create a portable, agent-readable kit that encapsulates the Air Fryer Probe brand so any AI tool can generate **on-brand assets** without guessing — and a non-designer can produce usable content from the kit + AI alone.

### What "on-brand assets" means

| Asset type | Examples |
|---|---|
| Product imagery | Probe in use on air fryer, lifestyle food shots, pack shots |
| Social graphics | Temperature tip posts, feature callouts, testimonial cards |
| Branded overlays | Logo + tagline on photography, text-on-image posts |
| Copy | Headlines, captions, ad text, email subject lines |
| Future: website UI | Landing page sections, product page, checkout (deferred) |

## Success criteria

A client with **no design software** should be able to produce usable on-brand content from this kit + AI tools. An agent reading the kit should be able to:

1. **Generate lifestyle and product scenes** via `creative/image-prompts.md` — correct mood, product shape, dark-navy palette
2. **Write captions and tips** that sound like the brand, not generic AI (`company/brand/voice.md`)
3. **Prompt an image generator** with accurate product description and scene direction (`company/product.md`)
4. **Know when to composite** — logo and precise typography come from `company/brand/assets/logos/` and `social/templates.md`, not from the image model
5. **Publish caption-only posts** — real photography + generated copy, no designed card required
6. **Avoid brand violations** — no retyped logo, wrong orange, banned words, mixed photo styles, or carry-over temp offsets

Exact Rubik/Roboto Mono rendering in a finished graphic is a **compositing** step when needed; AI-generated scene JPEGs do not need embedded fonts.

## Scope: in vs out

### In scope (now)

- [x] company/brand/design.md (Google DESIGN.md format design system)
- [x] Company overview, product, audience, voice docs
- [x] Asset manifest with local photography (`social/assets-manifest.md`)
- [x] AI generation prompt templates
- [x] Agent entry points (README.md, AGENTS.md)
- [x] Display font — Rubik 700/800 via Google Fonts (replaces Angelic Child — see `typography-research.md`)
- [x] Full local asset library — 43 image files per `social/assets-manifest.md`; re-download via `scripts/download-assets.sh`
- [x] Logo variants — reverse, on-dark, icon (`company/brand/assets/logos/`)
- [x] Temperature guide content (exact temps per protein) — `company/temperature-guide.md`

### Out of scope (later)

- New website design and build
- Shopify theme changes
- Ecommerce integration
- SEO / analytics setup
- Paid ad campaign management
- airfryerprobe.co.uk domain setup (domain not resolving as of June 2026)

## Workflow vision

```
Brand kit (this repo)
    ↓
Agent reads design.md + company docs + creative/generation-workflow.md
    ↓
Generates: scene / copy / (optional) background for composite
    ↓
Validates against product.md + design.md Do's and Don'ts
    ↓
Composites logo/type only when asset type requires it (see creative/generation-workflow.md)
    ↓
Optional human polish (out of kit scope)
    ↓
Publish to Instagram / Facebook / future site
```

## Open decisions (to resolve with client)

| Decision | Options | Notes |
|---|---|---|
| Domain strategy | .com vs .co.uk | .com is live; .co.uk mentioned but not resolving |
| Photography policy | Real-first vs AI-assisted | ✅ Real-first for published posts; AI for scenes when no photo fits; caption-only path first-class |
| Display font | Rubik via Google Fonts | ✅ Decided Jun 2026 — Bold/Extra Bold; OFL commercial use |
| Logo variants | Create reverse/icon versions | ✅ Done — `company/brand/assets/logos/` |
| Temperature chart data | Extract exact values from PVC guide | ✅ Done — see `company/temperature-guide.md` |
| Brand name formatting | "Air Fryer Probe" vs "AIR FRYER PROBE" | Logo uses stacked AIR FRYER / PROBE |

## Maintenance

| Document | Update when |
|---|---|
| design.md | Visual identity changes, new colours, font updates |
| company/product.md | Spec changes, new bundle items, pricing |
| social/assets-manifest.md | New photography, logo variants, font files added |
| creative/image-prompts.md | New scene types, platform formats, prompt learnings |
| reference/site-extraction.md | Re-scrape after major site changes |

## Related future work

1. **Website rebuild** — use this kit as source of truth for Astro/Next.js build
2. ~~**Local asset download**~~ — done; see `social/assets-manifest.md`
3. **Programmatic overlays** (optional) — HTML/SVG templates → PNG with Rubik from Google Fonts + embedded logo; no Affinity/Figma required
4. **Temperature guide digitisation** — structured data for social tip automation
5. ~~**Logo variant creation**~~ — done; see `company/brand/assets/logos/`
