# AI Image Generation — Prompt Guide

Use with Midjourney, DALL·E, Gemini, Flux, or similar. Always cross-reference `company/product.md` for physical accuracy and `company/brand/design.md` for visual style.

## General rules

1. **Reference real photography first** — use CDN filenames in `social/assets-manifest.md` as style references where the tool supports image input
2. **Dark-first palette** — scenes default to Dark Navy (`#11151C`) backgrounds or warm moody kitchen lighting
3. **No logo retyping** — composite the SVG logo in post-production; do not ask AI to render the wordmark
4. **One hero subject** — probe, food, or temperature stat per image
5. **UK kitchen context** — countertop air fryer, typical UK home kitchen, not US-style or restaurant kitchen

---

## Product form factor (include in every product prompt)

```
handheld digital meat thermometer, dark grey plastic body, rectangular LCD display showing temperature in celsius, folding stainless steel probe needle, small hanging loop at top, compact 160mm long, professional kitchen thermometer
```

---

## Scene templates

### 1. Probe hanging on air fryer (hero lifestyle)

```
A digital meat thermometer hanging on the side of a black countertop air fryer via a small adhesive hook, probe caddy loop visible, modern UK kitchen counter, warm ambient lighting, shallow depth of field, the air fryer basket slightly visible, clean composition, product photography style, no text, no logos
```

**Negative prompt:** `blurry, distorted text, wrong probe shape, oven instead of air fryer, professional restaurant kitchen, cluttered counter, people, hands`

### 2. Probe in use — checking chicken

```
Close-up of a digital meat thermometer probe inserted into a golden roasted chicken breast inside an air fryer basket, LCD display readable showing 74 degrees celsius, warm appetising food photography, shallow depth of field, steam rising slightly, UK home kitchen, moody warm lighting, no text, no logos
```

### 3. Product pack shot

```
Digital meat thermometer product photography, dark grey probe with folding stainless steel needle and large LCD display, isolated on dark navy background (#11151C), clean high contrast studio lighting, probe as hero, no clutter, commercial product shot, no text, no logos
```

### 4. Bundle flat lay

```
Flat lay product photography on dark charcoal surface: digital meat thermometer, small magnetic temperature reference chart, self-adhesive plastic hook, neatly arranged, overhead shot, warm studio lighting, clean composition, kitchen gadget bundle, no text, no logos
```

### 5. Temperature guide scene

```
Cooked juicy chicken breast on a wooden cutting board, digital meat thermometer probe beside it showing temperature on LCD, warm moody food photography, shallow depth of field, steam, appetising, UK home cooking, no text overlays, no logos
```

### 6. Multi-use (BBQ / grill)

```
Digital meat thermometer checking sausages on a UK garden BBQ grill, summer evening, warm golden hour light, probe inserted into sausage, LCD display visible, casual outdoor cooking, no text, no logos
```

---

## Social graphic backgrounds (generate base image only)

Generate the **background/scene** without text. For branded type and logo, composite separately — see `creative/generation-workflow.md` and `social/templates.md` (Rubik 700–800 + Roboto Mono; logo from `company/brand/assets/logos/`).

### Dark feed post background
```
Abstract dark navy background with subtle warm orange light leak in corner, minimal, clean, space for text overlay on left third, moody, professional, no text, no logos, 1:1 aspect ratio
```

### Food + dark overlay
```
Appetising close-up of perfectly cooked chicken breast, dark vignette overlay, space for text at top, warm food photography, moody, 1:1 aspect ratio, no text, no logos
```

---

## Style modifiers

Add to any prompt:

| Modifier | Effect |
|---|---|
| `warm moody food photography` | Lifestyle shots |
| `clean high contrast product photography` | Pack shots |
| `shallow depth of field, bokeh` | Focus on probe/food |
| `UK home kitchen` | Correct context |
| `dark navy background` | Brand-aligned pack shots |
| `professional but approachable` | Tone guard |

## Negative prompts (global)

Always include:
```
text, words, letters, watermark, logo, brand name, deformed probe, wrong thermometer shape, analog dial thermometer, smart bluetooth thermometer, app on phone, restaurant kitchen, chef in whites, cluttered, oversaturated, cartoon, illustration, 3d render look
```

---

## Post-production checklist

After generating:

- [ ] Probe shape matches `company/product.md` description
- [ ] Scene is air fryer context (if air fryer scene)
- [ ] No AI-hallucinated text on probe LCD (replace with real temp in edit if needed)
- [ ] Composite logo from `company/brand/assets/logos/` (pick variant per `company/brand/design.md` § Logo Usage)
- [ ] Apply text per `social/templates.md` typography rules
- [ ] Export at correct dimensions (1080×1080 etc.)
- [ ] Compare colour treatment to company/brand/design.md palette

---

## Reference image workflow

When the tool supports image-to-image or style reference:

1. Use local files from `social/assets-manifest.md` (see Recommended reference images)
2. Use `company/brand/assets/images/photography/lifestyle/probe_haning_in_air_fryer.jpg` for hanging scenes
3. Use `company/brand/assets/images/photography/product/AFB_EDIT_1_DSCF1530.jpg` for product shape reference
4. Use `company/brand/assets/images/photography/lifestyle/probewithsteak.png` for food styling reference
5. Set style strength: 60–80% for variation, 90%+ for strict product match
