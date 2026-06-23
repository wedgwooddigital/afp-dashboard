# Social — brand & design references

Quick tokens for social graphics and copy. `website.brand_source: ops_local` — canonical source is this repo.

See also: [assets-manifest.md](./assets-manifest.md) for logo and image file paths.

---

## Canonical docs

| Topic | Path |
|-------|------|
| **Colours & typography** | `company/brand/branding.md` |
| **Voice & tone** | `company/brand/voice.md` |
| **UI patterns & logo rules** | `company/brand/design.md` |
| **Live site reference** | `company/facts.yaml` → `website.url` |

If anything conflicts, **`company/brand/` wins**.

---

## Quick tokens (social-safe)

### Colours

| Name | Hex | Social use |
|------|-----|------------|
| **Dark Navy** | `#11151C` | Default post backgrounds |
| **Brand Orange** | `#FD9E27` | CTAs, headings, temp highlights |
| **Logo Orange** | `#F9A027` | Wordmark on dark |
| **Neutral** | `#F4F4F4` | Light post backgrounds |
| **Body text (light bg)** | `#222222` | Captions on light |

### Typography

| Role | Font | Weight |
|------|------|--------|
| Headings | Rubik | 700, 800 |
| Body | Roboto Mono | 400, 700 |

### Voice (summary)

- Confident, direct — cook to temperature, not time
- No *revolutionary* / *game-changing* in brand-written copy
- Full guide: `company/brand/voice.md`

---

## How to use brand assets

```bash
./scripts/resolve-website-asset.sh logos/artboard-2.svg
./scripts/resolve-website-asset.sh images/graphics/air-fryer-chart-final-preview.png
```

Finished social graphics → **`social/output/`** only.

---

## Platform specs

| Platform | Notes |
|----------|-------|
| Facebook | 1200×630 link preview; 1080×1080 feed |
| Instagram | 1080×1080 feed; 1080×1920 stories/reels |

---

## Workflow

1. Read `company/brand/voice.md` + this doc
2. Resolve assets via script or manifest
3. Draft copy → `social/drafts/`
4. Export graphics → `social/output/`
5. Publish after approval
