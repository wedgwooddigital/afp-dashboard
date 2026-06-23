# Brand Kit — Adversarial Review & Backlog

**Reviewed:** June 2026  
**Purpose:** Actionable findings from a full review of this workspace as a tool for producing on-brand content. Work through sections in priority order; check items off as you complete them.

**Related:** [README.md](./README.md) · [AGENTS.md](./AGENTS.md) · [company/goals.md](./company/goals.md) · [Client site notes for Ben](./reference/CLIENT-SITE-NOTES.md)

---

## Executive summary

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Strategic clarity | A | `goals.md`, `AGENTS.md`, clear scope |
| Visual identity | B+ | `design.md` thorough; production blockers remain |
| Product truth | B | Good physical description; bundle facts incomplete |
| Voice & copy | B | Solid rules; blog/site voice conflicts unaddressed |
| AI workflows | B+ | `generation-workflow.md` + image/social guides; other channels thin |
| Asset library | B+ | Local photos, manifest, download scripts |
| Operational hygiene | C+ | Git initialised; doc drift and duplicates remain |
| Production readiness | B− | AI scenes + copy ready; full branded cards need composite step, not Figma |

**Verdict:** Strong v1 knowledge base for *guiding* agents. AI-first path is viable for scenes and copy; full branded social cards need compositing (logo + type), not a Figma template in the kit. Remaining gaps: canonical fact layer, gold-standard examples, channel templates.

---

## Progress tracker

### Week 1 — Stop the bleeding

- [x] Initialise git
- [x] Add `.gitignore` (bulk assets excluded; re-download via `./scripts/download-assets.sh`)
- [x] Document asset workflow on new machine (`README.md`)
- [x] Reconcile image counts across `README.md`, `company/goals.md`, `social/assets-manifest.md`
- [x] Remove `.firecrawl/` scrape cache
- [x] Delete root duplicates: `Artboard 2.svg`, `air-fryer-chart-final-preview.png` (canonical: `company/brand/assets/logos/`, `company/brand/assets/images/graphics/`)
- [x] Add mini screwdriver to `company/product.md` bundle contents (in-the-box only, not marketing)
- [x] Fix broken chart path in `company/temperature-guide.md` (definitive: `company/brand/assets/images/graphics/air-fryer-chart-final-preview.png`)
- [x] Align chicken temp to 74°C in `social/templates.md` (removed 72°C carry-over)
- [x] Add content-policy firewall to `AGENTS.md` + `company/content-policy.md`
- [x] Initial git commit (`75fe82e` — 42 files, bulk assets gitignored)

### Week 2 — Unblock production

- [x] Display font — **Rubik** Bold (700) / Extra Bold (800) via Google Fonts (replaces Angelic Child)
- [x] Create logo reverse variant (`artboard-2-reverse.svg`)
- [x] Create logo on-dark variant (`artboard-2-on-dark.svg`)
- [x] Create logo icon variants (`artboard-2-icon.svg`, `-icon-reverse.svg`)
- [x] Reframe kit as AI-first — `creative/generation-workflow.md`; Affinity/Figma optional polish only
- [ ] Resolve carry-over temp guidance: document in `temperature-guide.md` *or* remove from `social-templates.md` (74°C definitive per notes; verify no 72°C remains)

### Week 3 — Scale content production

- [x] Add `company/facts.yaml` — single machine-readable source of truth
- [x] Add `company/content-policy.md` — voice firewall, food safety, reference vs canonical
- [x] Add `company/trust-and-proof.md` — founder bio, verifiable claims, review sourcing
- [ ] Add `examples/social/` — 2–3 gold-standard posts (image + caption + compliance notes)
- [ ] Add `creative/copy-templates.md` — Meta/Google ads, email, newsletter
- [ ] Add `company/temperature-guide.json` for automation (optional)
- [x] Add `.cursor/rules/` pointing agents to `AGENTS.md`

---

## What works well

Keep these as the foundation; extend rather than replace.

1. **Agent entry point** — `AGENTS.md` routes tasks with hard rules (logo SVG, banned words, temp data).
2. **`design.md` as anchor** — YAML tokens + prose + Do's/Don'ts + social dimensions.
3. **Product description for AI** — `company/product.md` dimensions, visual cues, anti-patterns.
4. **Temperature data** — `company/temperature-guide.md` with ready-made social copy.
5. **Asset pipeline** — `scripts/discover-assets.sh`, `download-assets.sh`, `social/assets-manifest.md`.
6. **Site extraction architecture** — `reference/site-content/` with deduplicated `content-inventory.md`.

---

## Problems to fix

### 1. Documentation drift

Agents trust stale numbers. Reconcile and keep in sync.

| Source | Claim | Action |
|--------|-------|--------|
| `README.md` | 42 images | Update to match manifest |
| `social/assets-manifest.md` | 41 CDN + 42 local | Verify against `find assets` |
| `company/goals.md` | 29 images | Update — outdated |

**Rule going forward:** `social/assets-manifest.md` is the asset count source of truth; other docs link to it.

### 2. Incomplete canonical product facts

`reference/site-content/content-inventory.md` lists **mini screwdriver** in bundle. `company/product.md` does not.

**Fix:** Add to bundle table in `company/product.md` and any future `facts.yaml`.

### 3. Inconsistent temperature advice

| Source | Chicken guidance |
|--------|------------------|
| `company/temperature-guide.md` | 74°C (FSA minimum) |
| `social/templates.md` Template 1 | Pull at 72°C, rest for carry-over |

Carry-over is valid technique but contradicts the safe-minimum framing unless explicitly documented.

**Fix (choose one):**
- **A:** Add carry-over section to `temperature-guide.md` with FSA framing and air-fryer notes.
- **B:** Remove 72°C carry-over from social template; use 74°C only.

### 4. Voice rules vs live site content

Brand voice discourages **revolutionary** and **game-changing** in brand-written copy (OK in customer quotes). **Ultimate** is allowed (client preference, Jun 2026). Live blog uses *ultimate* heavily — now aligned with kit.

**Fix:** ✅ Content policy in `AGENTS.md` and `company/content-policy.md`. Client-facing site issues: [reference/CLIENT-SITE-NOTES.md](./reference/CLIENT-SITE-NOTES.md).

### 5. Broken file references

- `temperature-guide.md` references `air-fryer-chart-final-preview.png` at repo root — file is only under `company/brand/assets/images/graphics/` (root copy should be deleted).
- Root `Artboard 2.svg` duplicates `company/brand/assets/logos/artboard-2.svg`.

### 6. Triple site-archive redundancy

| Location | Status |
|----------|--------|
| `reference/site-content/` | **Keep** — processed, canonical for site reference |
| `reference/site-content/.raw/` | **Keep** — for diffing on re-scrape (gitignored) |
| `.firecrawl/` | **Delete locally** — unprocessed duplicate (gitignored) |

### 7. `design.md` version mismatch

YAML frontmatter says `version: alpha`; body says `Version: 1.2`. Pick one and align.

### 8. Unverified claims that agents may treat as facts

| Claim | Where | Risk |
|-------|-------|------|
| 300k Facebook followers | Site footer HTML | Wrong (~80 actual); **remove from theme**; never cite follower counts in copy |
| Klarna instalments | `overview.md` | Product is £23.99; Klarna requires £50+ on site |
| 25 years in catering | `overview.md`, `trust-and-proof.md` | ✅ Verified — client-confirmed Jun 2026 |

**Fix:** ✅ Documented in `company/trust-and-proof.md` — verified vs marketing claim vs do-not-use-in-copy.

### 9. Contact identity split

- Public: `ben@airfryerprobe.com`
- Policies: `benjaminjcribb@gmail.com`

Not in `company/` docs. Add canonical contact to `company/overview.md` or `facts.yaml`.

### 10. Generic asset filenames

`Untitled_design_78.png`, `Screenshot_16.png` — manifest describes them but semantic renames would help agent retrieval (optional, lower priority).

---

## Missing assets & guides

### P0 — Blocks production output

| Item | Why |
|------|-----|
| ~~Angelic Child font~~ | ✅ Replaced with Rubik (Google Fonts) |
| ~~Logo reverse variant~~ | ✅ `artboard-2-reverse.svg` |
| ~~Logo icon-only variant~~ | ✅ `artboard-2-icon.svg` |
| ~~Figma / Canva template~~ | **Removed from roadmap** — kit is AI-first; `social-templates.md` + `generation-workflow.md` define composite specs; programmatic overlays optional later |

### P1 — Reduces agent errors

| Item | Purpose |
|------|---------|
| ~~`creative/generation-workflow.md`~~ | ✅ Generate vs composite decision tree |
| `company/facts.yaml` | ✅ Single source: price, URL, bundle, specs, handles, banned words |
| `company/content-policy.md` | Canonical vs reference; food safety; blog vs brand voice |
| `examples/social/` | Gold-standard outputs agents can mimic |
| Brand compliance checklist | Standalone pre-publish check (beyond `image-prompts.md`) |
| `.cursor/rules/` | ✅ Session-level routing to `AGENTS.md` |

### P2 — Expands channel coverage

| Item | Purpose |
|------|---------|
| `creative/copy-templates.md` | Meta/Google ads, email welcome, post-purchase |
| `creative/blog-templates.md` | SEO structure without banned words |
| `creative/video-scripts.md` | Reels / TikTok hooks |
| `company/competitors.md` | vs Amazon probes, Meater, Thermapen |
| `company/seasonal-calendar.md` | Christmas, BBQ season, etc. |
| `company/temperature-guide.json` | Structured data for automation |

### P3 — Future website phase (deferred)

- Component → token mapping for React/HTML
- Branded icon set (Lucide recommended in `design.md`; repo has 3 Icons8 PNGs)
- Alt-text library per photograph
- Domain strategy decision (`.com` vs `.co.uk`)

---

## AGENTS.md task routing gaps

Add these rows when the corresponding guides exist:

| Task | Should read |
|------|-------------|
| Write blog post | `company/brand/voice.md`, `temperature-guide.md`, `creative/blog-templates.md` |
| Write Meta/Google ad | `company/brand/voice.md`, `audience.md`, `creative/copy-templates.md` |
| Write newsletter | `company/brand/voice.md`, `overview.md`, `creative/copy-templates.md` |
| Compose branded graphic | `creative/generation-workflow.md`, `social-templates.md`, `design.md` |
| Refresh site snapshot | `scripts/build-site-extraction.py`, Firecrawl workflow |
| Re-download assets | `scripts/download-assets.sh` |

---

## Success criteria self-test

From `company/goals.md` — can the kit pass its own bar?

| Criterion | Pass? | Blocker |
|-----------|-------|---------|
| Lifestyle / product scene via AI | Yes | `image-prompts.md` + `product.md` |
| Caption-only post on-brand | Yes | If agent reads voice doc, not blog scrape |
| Full branded social card (Rubik + logo) | Partial | Needs composite step — specs in `social-templates.md`; not a kit blocker |
| Image generator prompt accuracy | Yes | Strong `product.md` + `image-prompts.md` |
| Logo applied correctly | Yes | Variants in `company/brand/assets/logos/`; composite when needed |
| Avoid brand violations | At risk | Reference material can undermine rules if agents skip `content-policy.md` |

---

## Canonical vs reference (agent firewall)

```
CANONICAL (new assets)          REFERENCE (legacy site)
─────────────────────────       ─────────────────────────
design.md                       reference/site-content/*
company/*                       .firecrawl/ (delete)
creative/*                         reference/site-content/.raw/
social/assets-manifest.md
```

**Highest-risk failure mode:** Agent reads `reference/site-content/blog/` for tone and produces copy with banned words and outdated positioning.

---

## What you do not need (yet)

- Full website rebuild scaffolding — correctly deferred per `goals.md`
- SEO / analytics setup — out of scope for brand kit phase
- Figma / Affinity templates in the kit — client may use for optional polish; not the assumed workflow
- Git LFS — not needed if images stay local / CDN re-download
- Duplicate temperature data in many formats — markdown + optional JSON is enough

---

## Maintenance triggers

| When | Update |
|------|--------|
| Shopify price or bundle changes | `company/facts.yaml`, `company/product.md`, `content-inventory.md` |
| New photography on site | `./scripts/download-assets.sh`, `social/assets-manifest.md` |
| Major site restructure | Re-scrape → `scripts/build-site-extraction.py` |
| Visual identity change | `design.md`, logo assets, `social/templates.md` |
| New social format / platform | `social/templates.md`, `design.md` § Social |
| Voice or tagline change | `company/brand/voice.md`, `AGENTS.md` hard rules |

---

## Client site follow-ups (out of scope — relationship / urgent fixes)

Full detail, locations, and talking points: **[reference/CLIENT-SITE-NOTES.md](./reference/CLIENT-SITE-NOTES.md)**

| Priority | Item | Status |
|----------|------|--------|
| 🟡 | “Temperatue guide” typo on homepage (visible) | [ ] Optional mention to Ben |
| 🟡 | “300k Followers” footer label (HTML) | Recommend Ben remove — wrong count; never display follower numbers |
| 🟢 | Dormant carousel (HTML only, not prominent) | Optional theme cleanup |
| 🟢 | Demo collection `/kitchen-and-dining-example-products` | [ ] Only if linked from nav |
| ✅ | Bundle marketing split (3-in-1 vs specs) | Agreed — in `company/product.md` |
| ✅ | “Ultimate” in brand voice | Allowed per client |

---

## Notes

_Add your own decisions and completion dates below as you work through the backlog._

| Date | Item | Decision / notes |
|------|------|------------------|
| Jun 2026 | Carry-over temps (72°C vs 74°C) | **74°C definitive** per `company/brand/assets/images/graphics/air-fryer-chart-final-preview.png`. No carry-over offsets in brand content. |
| Jun 2026 | Mini screwdriver in bundle | In-the-box / specs only — not a marketing feature alongside guide and hook. |
| Jun 2026 | “Ultimate” in brand voice | **Allowed** — client preference; removed from banned words. |
| | Domain strategy (.com vs .co.uk) | |
| Jun 2026 | Display font | **Rubik** 700/800 via Google Fonts |
| Jun 2026 | AI-first kit direction | No Figma/Affinity in kit workflow; `creative/generation-workflow.md`; manual polish optional |
| Jun 2026 | Photography policy | Real-first for published posts; AI for scenes when no photo fits; caption-only path first-class |
