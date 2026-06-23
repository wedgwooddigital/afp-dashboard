---
title: Product & lifestyle image prompts
description: AI scene prompts for probe photography — Midjourney, Gemini, Flux, DALL·E
kind: prompts
order: 30
clientVisible: false
updated: 2026-06-23
changelog: "v1 — distilled from creative/image-prompts.md"
tier: all
---

# Product & lifestyle image prompts

Use with Midjourney, DALL·E, Gemini, Flux, or similar. **Never ask AI to render the wordmark** — composite logo from `company/brand/assets/logos/` in post-production.

Paste the **form factor block** into every product prompt.

## Form factor block (always include)

```text
handheld digital meat thermometer, dark grey plastic body, rectangular LCD display showing temperature in celsius, folding stainless steel probe needle, small hanging loop at top, compact 160mm long, professional kitchen thermometer
```

## Global negative prompt

```text
text, words, letters, watermark, logo, brand name, deformed probe, wrong thermometer shape, analog dial thermometer, smart bluetooth thermometer, app on phone, restaurant kitchen, chef in whites, cluttered, oversaturated, cartoon, illustration, 3d render look
```

---

## Scene 1 — Probe hanging on air fryer (hero)

```text
A digital meat thermometer hanging on the side of a black countertop air fryer via a small adhesive hook, probe caddy loop visible, modern UK kitchen counter, warm ambient lighting, shallow depth of field, the air fryer basket slightly visible, clean composition, product photography style, no text, no logos
```

## Scene 2 — Checking chicken (74°C)

```text
Close-up of a digital meat thermometer probe inserted into a golden roasted chicken breast inside an air fryer basket, LCD display readable showing 74 degrees celsius, warm appetising food photography, shallow depth of field, steam rising slightly, UK home kitchen, moody warm lighting, no text, no logos
```

## Scene 3 — Dark navy pack shot

```text
Digital meat thermometer product photography, dark grey probe with folding stainless steel needle and large LCD display, isolated on dark navy background (#11151C), clean high contrast studio lighting, probe as hero, no clutter, commercial product shot, no text, no logos
```

## Scene 4 — 3-in-1 bundle flat lay

```text
Flat lay product photography on dark charcoal surface: digital meat thermometer, small magnetic temperature reference chart, self-adhesive plastic hook, neatly arranged, overhead shot, warm studio lighting, clean composition, kitchen gadget bundle, no text, no logos
```

## Scene 5 — BBQ / grill (seasonal)

```text
Digital meat thermometer checking sausages on a UK garden BBQ grill, summer evening, warm golden hour light, probe inserted into sausage, LCD display visible, casual outdoor cooking, no text, no logos
```

---

## Style modifiers

Add as needed: `warm moody food photography` · `UK home kitchen` · `shallow depth of field, bokeh` · `dark navy background`

## Reference images

When the tool supports image input, use files from `social/assets-manifest.md`:

- Hanging scene: `company/brand/assets/images/photography/lifestyle/probe_haning_in_air_fryer.jpg`
- Product shape: `company/brand/assets/images/photography/product/AFB_EDIT_1_DSCF1530.jpg`

## Post-generation checklist

- [ ] Probe shape matches `company/product.md`
- [ ] No AI-hallucinated text on LCD
- [ ] Logo composited from SVG — not AI-generated
- [ ] Chicken scenes show **74°C** if a temp is visible
