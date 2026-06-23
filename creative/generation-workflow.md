# AI Generation Workflow

Decision guide for producing on-brand content from this kit **without design software**. Manual editing (Affinity, Canva, etc.) is optional polish — not the assumed path.

**Read first:** `company/brand/design.md` · `company/product.md` · `company/brand/voice.md`

---

## One rule: generate vs composite

Pure image models rarely render Rubik, exact `#FD9E27`, and the SVG wordmark correctly. Route by asset type:

| Do in AI | Do not ask AI to render |
|----------|-------------------------|
| Lifestyle scenes, mood, lighting | Wordmark / "AIR FRYER PROBE" text |
| Product shape and pack shots | Precise brand typography (Rubik, Roboto Mono) |
| Food photography backgrounds | Multi-line branded social layouts |
| Abstract dark-navy backgrounds | Logo from memory — always use `company/brand/assets/logos/` SVGs |

For anything in the right column, the kit provides **copy blocks, dimensions, colour hex, and logo paths** (`social/templates.md`) — composite with whatever tool you have, or skip the designed card (see caption-only workflow below).

---

## Content types by AI suitability

| Type | AI-first? | Kit focus |
|------|-----------|-----------|
| Lifestyle / product scenes | Yes | `creative/image-prompts.md`, real photo refs in `social/assets-manifest.md` |
| Pack shots on dark navy | Yes | Prompt templates + negative prompts in `image-prompts.md` |
| Temperature tip image | Partial | AI: background/food only; text/logo via composite or caption-only |
| Full branded social card (Rubik + logo) | Hard in pure gen | `social/templates.md` specs + logo SVG; composite separately |
| Captions, tips, ad copy | Yes | `company/brand/voice.md`, `temperature-guide.md` |
| Caption-only post (real photo + text) | Yes | `company/brand/assets/images/photography/*` + generated caption — no designed card |

---

## Decision tree

```
What are you making?
│
├─ Copy only (caption, ad, email subject)
│   └─ company/brand/voice.md + audience.md + product.md
│       → Validate: banned words, bundle facts, temp data from temperature-guide.md
│
├─ Product / lifestyle image
│   └─ image-prompts.md (pick scene template)
│       → Upload reference from social/assets-manifest.md if tool supports image input
│       → Validate against product.md physical description
│       → Optional: composite logo if hero post needs branding
│
├─ Social graphic with text + logo
│   ├─ Can you skip the designed card?
│   │   └─ YES → Real photo from company/brand/assets/images/photography/ + caption-only (fastest path)
│   └─ NO → Generate background only (image-prompts.md § Social graphic backgrounds)
│       → social/templates.md for layout, copy, dimensions, colours
│       → Composite logo from company/brand/assets/logos/ + type (Rubik 700–800, Roboto Mono)
│       → Optional human polish — not required for kit compliance if specs are met
│
└─ Temperature tip
    └─ temperature-guide.md (temps — no carry-over offsets)
        → Option A: caption-only on real food photo
        → Option B: AI background + composite text per social/templates.md Template 1
```

---

## Standard workflow

```
1. Generate     → Pick prompt or copy guide (see decision tree)
2. Validate     → product.md (shape, bundle) + company/brand/design.md (colours, don'ts)
3. Composite    → Only if asset type needs logo/type (see table above)
4. Caption      → company/brand/voice.md
5. Polish       → Optional — fix AI mistakes, personal preference; out of kit scope
6. Publish
```

---

## Reference images for style lock

When the image tool accepts reference uploads, prefer these from `social/assets-manifest.md`:

| Goal | Suggested references |
|------|---------------------|
| Probe shape accuracy | Pack shots, `DSC_*.jpg` product photos in `company/brand/assets/images/photography/` |
| Lifestyle / in-use | Probe-on-air-fryer shots, kitchen context photos |
| Dark brand mood | Pack shots on navy, graphics with `#11151C` backgrounds |
| Food styling | Chicken, sausage, or protein shots matching the tip |

Always cross-check AI output against the physical description in `company/product.md` — wrong probe shape is the most common failure.

---

## Caption-only workflow (first-class)

Not every post needs a designed card. For many clients this is the default:

1. Pick a real product or food photo from `company/brand/assets/images/photography/` (preferred over AI)
2. Generate caption from `company/brand/voice.md` + `temperature-guide.md` if educational
3. Check `company/brand/design.md` Do's and Don'ts for voice and claims
4. Publish — no compositing step

---

## What the kit does not assume

- Affinity, Figma, or Canva installed
- Local font files embedded in exported JPEGs (Rubik loads from Google Fonts when compositing; AI scene JPEGs do not need embedded fonts)
- Manual post-production on every asset

Optional polish with any design tool is fine; the kit documents the **generate → validate** path as primary.

---

## Related guides

| File | Role |
|------|------|
| [image-prompts.md](./image-prompts.md) | Scene and background prompts |
| [social/templates.md](./social/templates.md) | Layout specs when compositing is needed |
| [README.md](./README.md) | Overview and common mistakes |
