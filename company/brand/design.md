---
version: alpha
name: Air Fryer Probe
description: Visual identity for Air Fryer Probe — precision cooking tools for air fryer users. Dark-first palette, technical typography, confident practical voice.
colors:
  primary: "#11151C"
  secondary: "#414449"
  tertiary: "#FD9E27"
  neutral: "#F4F4F4"
  surface: "#414449"
  on-surface: "#FFFFFF"
  brand-logo: "#F9A027"
  brand-tint: "#FEF0D6"
  text-on-light: "#222222"
  text-secondary: "#666666"
  sale: "#E84E4E"
  border: "#EEEEEE"
  button-hover-bg: "#BBBBBB"
  button-hover-text: "#11151C"
typography:
  display-h1:
    fontFamily: Rubik
    fontSize: 60px
    fontWeight: 800
    lineHeight: 1.1
    letterSpacing: 0px
  display-h2:
    fontFamily: Rubik
    fontSize: 42px
    fontWeight: 700
    lineHeight: 1.15
    letterSpacing: 0px
  display-h3:
    fontFamily: Rubik
    fontSize: 36px
    fontWeight: 700
    lineHeight: 1.2
    letterSpacing: 0px
  display-h4:
    fontFamily: Rubik
    fontSize: 24px
    fontWeight: 700
    lineHeight: 1.25
    letterSpacing: 0px
  body-md:
    fontFamily: Roboto Mono
    fontSize: 16px
    fontWeight: 400
    lineHeight: 28px
    letterSpacing: 0px
  body-bold:
    fontFamily: Roboto Mono
    fontSize: 16px
    fontWeight: 700
    lineHeight: 28px
    letterSpacing: 0px
  label-button:
    fontFamily: Roboto Mono
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1
    letterSpacing: 0px
  label-temp:
    fontFamily: Roboto Mono
    fontSize: 24px
    fontWeight: 700
    lineHeight: 1.2
    letterSpacing: 0px
rounded:
  sm: 5px
  md: 10px
  pill: 40px
  full: 50%
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  section-mobile: 48px
  section-desktop: 64px
  section-major: 80px
  hero: 96px
  gutter: 24px
  container-max: 1200px
components:
  button-primary:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-surface}"
    typography: "{typography.label-button}"
    rounded: "{rounded.sm}"
    padding: 12px 16px
  button-primary-hover:
    backgroundColor: "{colors.button-hover-bg}"
    textColor: "{colors.primary}"
    typography: "{typography.label-button}"
    rounded: "{rounded.sm}"
  button-secondary:
    backgroundColor: transparent
    textColor: "{colors.tertiary}"
    typography: "{typography.label-button}"
    rounded: "{rounded.sm}"
    padding: 12px 16px
  announcement-bar:
    backgroundColor: "{colors.tertiary}"
    textColor: "{colors.on-surface}"
    typography: "{typography.body-md}"
  benefit-card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.md}"
    padding: 20px
  testimonial-card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.sm}"
    padding: 24px
  newsletter-input:
    backgroundColor: "#FFFFFF"
    textColor: "#000000"
    rounded: "{rounded.sm}"
    padding: 12px
---

# Air Fryer Probe — Design System

**Version:** 1.2  
**Last updated:** June 2026  
**Format:** [Google DESIGN.md](https://github.com/google-labs-code/design.md) (alpha)  
**Sources:** Logo SVG (`company/brand/assets/logos/artboard-2.svg`), live Shopify theme CSS (`airfryerprobe.com`)

---

## Overview

Air Fryer Probe is a precision cooking tool brand built around one core product: a 3-in-1 digital meat thermometer designed specifically for air fryer use. The visual identity is **dark-first, technical, and confident** — it should feel like a reliable instrument, not a lifestyle fad.

**Brand personality:** Authoritative but approachable. Kitchen-savvy without being chef-exclusive. Talks like a knowledgeable friend who has solved the "is it cooked?" problem.

**Target audience:** UK home cooks who own or are switching to an air fryer. They want confidence, not complexity. They respond to proof (temperature numbers, speed specs) over hype.

**Emotional goal:** Replace cooking anxiety with precision and trust. Every design decision should make the product feel precise, reliable, and easy to trust.

**Design principle:** Clarity earns confidence.

**Intended use:** Social media graphics, AI image generation, landing pages, ecommerce UI, branded overlays.

---

## Colors

The palette is **dark-first** with a single warm action colour. Near-black backgrounds carry a subtle cool undertone; orange is reserved for action and emphasis.

- **Primary / Dark Navy (`#11151C`):** Default background. Near-black with a cool blue undertone. Use instead of pure black for general backgrounds.
- **Secondary / Charcoal Grey (`#414449`):** Card surfaces, testimonial blocks, benefit sections. The workhorse mid-tone within the dark palette.
- **Tertiary / Brand Orange site (`#FD9E27`):** Headings, CTAs, announcement bar, accent. The single action colour — loses impact when used decoratively.
- **Brand Orange logo (`#F9A027`):** Logo wordmark only. Slightly warmer than site orange; use for logo reproduction.
- **Brand Tint / Warm Cream (`#FEF0D6`):** Logo secondary elements only ("PROBE" text, rules, connector icon). Not a general UI colour.
- **Neutral / Light Grey (`#F4F4F4`):** Light-mode section backgrounds when contrast break is needed.
- **On-surface / White (`#FFFFFF`):** Primary text on dark backgrounds.
- **Text on light (`#222222`):** Headings on light backgrounds.
- **Text secondary (`#666666`):** Body text on light backgrounds.
- **Sale (`#E84E4E`):** Discount pricing only.

### Colour rules

- Brand Orange appears on headings, primary CTA, and announcement bar — not as decoration.
- Pure black (`#000000`) is for dark-mode scheme and form field text only.
- White on Dark Navy is the primary reading experience.
- On light backgrounds, headings switch to Dark Grey and body to Mid Grey.

---

## Typography

Three typefaces, three distinct roles. Never collapse them.

- **Anton Modified (logo only):** Custom outlines in the logo SVG. Heavily modified Anton with a probe connector integrated into the "R". Never retyped — always use the SVG/image asset.
- **Rubik (display/headings):** Rounded geometric sans from [Google Fonts](https://fonts.google.com/specimen/Rubik). Section headings, social headlines, protein labels on temperature guides. **Extra Bold (800)** for hero H1 and primary social headlines; **Bold (700)** for H2–H4. SIL Open Font License — free commercial use.
- **Roboto Mono (body/UI):** Monospace for body copy, buttons, temperature values, specs. Weights 400 and 700. Reinforces the precision-instrument positioning.

### Type scale (desktop → tablet → mobile)

| Level | Desktop | Tablet | Mobile | Usage |
|---|---|---|---|---|
| H1 | 60px | 42px | 36px | Hero headlines |
| H2 | 42px | 33px | 29px | Section headings |
| H3 | 36px | 28px | 25px | Sub-section headings |
| H4 | 24px | 19px | 19px | Feature headings, card titles |
| H5 | 18px | — | 16px | Small headings, labels |
| H6 | 16px | — | 16px | Captions, meta |
| Body | 16px | 16px | 16px | Body copy, line-height 28px |

### Typography rules

- Logo font lives in the logo asset only.
- Rubik for display headings only — never body copy or long-form text.
- Heading letter spacing: 0px.
- Social graphics: max two type sizes per frame. Rubik (700–800) for headline; Roboto Mono for temperature values and body.
- Default heading treatment: Brand Orange on Dark Navy. On light sections: Dark Grey headings.

---

## Layout

**Grid model:** Fixed-max-width centred container (1200px) with fluid variant at 1420px and 65px offset.

**Breakpoints:** `sm` 640px · `md` 768px · `lg` 1024px · `xl` 1280px

**Spacing scale:** 4px base unit. All spacing is a multiple of 4px.

| Token | Value | Usage |
|---|---|---|
| xs | 4px | Icon padding, tight gaps |
| sm | 8px | Badge padding, list gaps |
| md | 16px | Base component padding |
| lg | 24px | Card padding, stacked gaps |
| xl | 32px | Section internal spacing |
| section-mobile | 48px | Section padding (mobile) |
| section-desktop | 64px | Section padding (desktop) |
| section-major | 80px | Major section separation |
| hero | 96px | Hero padding top/bottom |

Sections sit flush (0px inter-section gap). Visual separation comes from background colour changes and internal padding.

---

## Elevation & Depth

Minimal shadow. Hierarchy is conveyed through **tonal layers** (Dark Navy → Charcoal Grey → White cards) rather than heavy elevation.

| Context | Value |
|---|---|
| Benefit cards | `0px 4px 10px rgba(75, 46, 42, 0.35)` — warm brown base |
| Image overlay | `#000000` at 20% opacity |
| Scroll container | `0 4px 10px rgba(0,0,0,0.1)`, `0 2px 5px rgba(0,0,0,0.15)` |

Prefer warm-tinted shadows over cold grey shadows.

---

## Shapes

**Architectural precision, not softness.** Small radii as default; pills reserved for badges.

| Element | Radius |
|---|---|
| Inputs, buttons | 5px |
| Benefit cards | 10px |
| Product badges | 40px (pill) |
| Social icons | 50% (circle) |

---

## Components

### Primary CTA button

Background Brand Orange, white text, Roboto Mono 500 16px, 5px radius, 1px solid Brand Orange. Hover: grey background (`#BBBBBB`), Dark Navy text.

### Secondary / outline button

Transparent background, Brand Orange border and text, Roboto Mono 500 16px, 5px radius.

### Announcement bar

Brand Orange background, white text, Roboto Mono 400.

### Benefit card

Charcoal Grey background, 10px radius, 20px padding (25px mobile), warm shadow, white text.

### Testimonial card

Charcoal Grey background, Brand Orange heading, white body, orange stars, 5px radius.

### Newsletter input

White background, black text, `#EEEEEE` border, 5px radius.

### Temperature guide graphic (social/print)

Dark Navy background. Protein name in Rubik Extra Bold (Brand Orange or white). Temperature value in Roboto Mono bold (white). One protein per frame when possible. Data from `company/temperature-guide.md`.

---

## Do's and Don'ts

**Do:**
- Use Dark Navy as the default background for feed posts and landing sections.
- Lead with outcomes, not features. Use temperature data as proof.
- Place the logo as SVG — never retype the wordmark.
- Prefer real product photography over AI-generated images when available.
- Keep one message per social frame.
- Maintain WCAG AA contrast (white on Dark Navy, orange on dark backgrounds).

**Don't:**
- Recolour, stretch, rotate, or condense the logo.
- Use Warm Cream outside logo reproduction.
- Use Brand Orange decoratively — it is the action colour.
- Retype "AIR FRYER" in Anton or any substitute font.
- Mix product pack shots and lifestyle food photography in the same section.
- Use "revolutionary" or "game-changing" in brand-written copy (fine in customer testimonials). "Ultimate" is allowed.
- Place the logo on busy photography without a dark overlay.
- Use more than two type sizes in one social frame.

---

## Logo Usage

**Never retype the wordmark** — always use an SVG from `company/brand/assets/logos/`.

| File | Use when |
|------|----------|
| `artboard-2.svg` | Default — black background plate, orange + cream wordmark |
| `artboard-2-on-dark.svg` | Transparent background — dark navy `#11151C` or charcoal `#414449` |
| `artboard-2-reverse.svg` | Transparent background — brand orange `#FD9E27` or orange sections |
| `artboard-2-icon.svg` | Social avatars, favicons — cropped wordmark, min **48px** wide |
| `artboard-2-icon-reverse.svg` | Icon on orange backgrounds |

**Colours:**
- **"AIR FRYER"** — Brand Orange logo `#F9A027` (primary/on-dark) or White `#FFFFFF` (reverse)
- **"PROBE" and detail elements** — Warm Cream `#FEF0D6` (all variants)

**Clear space:** Minimum equals the height of the "A" in AIR FRYER on all sides.

**Minimum size:** 120px wide (full wordmark). 48px wide (icon variants).

| Background | Asset |
|---|---|
| Dark Navy, Charcoal Grey | `artboard-2-on-dark.svg` or `artboard-2.svg` |
| Black | `artboard-2.svg` |
| Light Grey, White | `artboard-2.svg` on dark container, or `artboard-2-on-dark.svg` on dark patch |
| Brand Orange | `artboard-2-reverse.svg` or `artboard-2-icon-reverse.svg` |
| Social avatar (48px+) | `artboard-2-icon.svg` / `-icon-reverse.svg` |

**Note:** The site currently uses a raster screenshot (`Screenshot_2025-12-03_at_14.05.26.png`) as header logo. Always use the SVG for reproduction.

---

## Photography and Image Style

Two modes — do not mix within the same section.

**Product photography:** Clean, high contrast, probe as hero. Simple dark or warm neutral backgrounds. No clutter. Reference filenames: `AFB_EDIT_1_DSCF1530.jpg`, `AFP_EDIT_2_DSCF1444.jpg`.

**Lifestyle / food photography:** Warm, slightly moody, shallow depth of field. Genuinely appetising cooked food. Kitchen context without aspirational-lifestyle excess. Probe visible in use on air fryer.

**AI-generated images:** The current site includes Gemini-generated images. For new brand assets, prefer real photography as reference. When generating AI images, match the warm moody lifestyle style and ensure the probe form factor is accurate (see `company/product.md`).

---

## Social Media Application

| Format | Dimensions | Notes |
|---|---|---|
| Square post | 1080×1080 | Default — product, tip, stat |
| Story / Reel cover | 1080×1920 | Hero image, single-message CTA |
| Landscape | 1200×628 | Testimonials, temperature guides |
| Facebook cover | 820×312 | Brand + tagline only |

**Social design rules:**
- One message per frame.
- Dark Navy default background for feed posts.
- Brand Orange + Dark Navy is the signature combination.
- Temperature guides: white text on dark, Roboto Mono for temps, Rubik Bold/Extra Bold for protein labels.

---

## Iconography

Outline icons, consistent stroke weight. Recommended: Lucide Icons (pairs with Roboto Mono). Sizes: 16px inline · 20px UI · 24px feature · 48px hero. Default white; active/highlight Brand Orange.

---

## Animation and Motion

| Duration | Usage |
|---|---|
| 0.1s | Micro-interactions |
| 0.25s | Standard hovers |
| 0.5s | Expanded transitions |
| 0.65s | Image fade-in |
| 1s | Scroll-triggered animations |
| 600ms | Fade-in-up entrance |

Easing: `cubic-bezier(0, 0, 0.3, 1)`. Content enters on scroll (fade-in-up pattern).

---

## CSS Token Reference

```css
/* Google Fonts — display + body */
@import url('https://fonts.googleapis.com/css2?family=Rubik:wght@700;800&family=Roboto+Mono:wght@400;700&display=swap');

:root {
  --color-bg-primary:       #11151C;
  --color-bg-surface:       #414449;
  --color-bg-light:         #F4F4F4;
  --color-brand:            #FD9E27;
  --color-brand-logo:       #F9A027;
  --color-brand-tint:       #FEF0D6;
  --color-text-primary:     #FFFFFF;
  --color-text-on-light:    #222222;
  --color-text-secondary:   #666666;
  --color-sale:             #E84E4E;
  --font-display:           'Rubik', sans-serif;
  --font-display-weight:    700;
  --font-display-weight-hero: 800;
  --font-body:              'Roboto Mono', monospace;
  --container-width:        1200px;
  --radius-input:           5px;
  --radius-button:          5px;
  --radius-card:            10px;
  --shadow-card:            0px 4px 10px rgba(75, 46, 42, 0.35);
}
```
