---
clientVisible: true
---

# Air Fryer Probe — Brand Guidelines

> **Canonical source** when `company/facts.yaml` → `website.brand_source: ops_local`.  
> Company story: [`company/overview.md`](../overview.md) · Design system detail: [`design.md`](./design.md)

## Color palette

| Name | Hex | Use |
|------|-----|-----|
| **Dark Navy** | `#11151C` | Default backgrounds, hero sections |
| **Brand Orange** | `#FD9E27` | CTAs, headings, accents — not body text |
| **Logo Orange** | `#F9A027` | Wordmark on dark backgrounds |
| **Neutral** | `#F4F4F4` | Light surfaces, cards |
| **Secondary surface** | `#414449` | Panels on dark backgrounds |
| **Sale / alert** | `#E84E4E` | Promotional badges only |

## Typography

| Role | Font | Weight | Source |
|------|------|--------|--------|
| Headings | Rubik | 700, 800 | [Google Fonts](https://fonts.google.com/specimen/Rubik) |
| Body | Roboto Mono | 400, 500, 700 | Google Fonts / system |
| Logo only | Anton Modified | — | Never retype — use SVG |

## Logo usage

**Never retype "AIR FRYER".** Use SVG from `company/brand/assets/logos/`.

| Variant | File | Use |
|---------|------|-----|
| Client original | `Artboard 2.pdf` | Client-supplied source artwork — archive only |
| Primary | `artboard-2.svg` | Default — black plate |
| On dark | `artboard-2-on-dark.svg` | Dark navy / charcoal backgrounds |
| Reverse | `artboard-2-reverse.svg` | Brand orange backgrounds |
| Icon | `artboard-2-icon.svg` | Social avatars (min 48px) |
| Icon reverse | `artboard-2-icon-reverse.svg` | Orange backgrounds |

Full rules: [`design.md`](./design.md) § Logo Usage.

## Brand promise

**Perfect Results. Every Time.** — Cook to temperature, not time. 3-in-1 bundle: digital probe + magnetic temperature guide + self-adhesive hook.

## Voice (summary)

Confident, direct, knowledgeable. Avoid *revolutionary* and *game-changing* in brand-written copy. Full guide: [`voice.md`](./voice.md).

## Asset locations

| Type | Path |
|------|------|
| Logos | `company/brand/assets/logos/` |
| Photography & graphics | `company/brand/assets/images/` |
| Inventory | `social/assets-manifest.md` |
| Resolve path | `./scripts/resolve-website-asset.sh logos/artboard-2.svg` |
