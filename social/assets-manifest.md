# Air Fryer Probe — Asset Manifest

**Source of truth for asset counts and inventory.** Other docs (`README.md`, `company/goals.md`, `AGENTS.md`) should reference this file — do not duplicate counts elsewhere.

**Status:** Complete (June 2026)  
**CDN base:** `https://airfryerprobe.com/cdn/shop/files/`  
**CDN master list:** `company/brand/assets/cdn-inventory.txt`

---

## Counts (authoritative)

| Metric | Count | Notes |
|---|---|---|
| **CDN-downloadable files** | 41 | Listed in `cdn-inventory.txt`; fetched via `./scripts/download-assets.sh` |
| **Local-only image files** | 2 | `company/brand/assets/images/graphics/air-fryer-chart-final-preview.png`, `company/brand/assets/logos/artboard-2.svg` |
| **Total image files on disk** | 43 | 41 CDN + 2 local-only |
| **Tracked in git** | 3 | `manifest.md`, `cdn-inventory.txt`, `artboard-2.svg` — bulk images gitignored |

Re-verify after changes: `find assets -type f ! -name 'manifest.md' ! -name 'cdn-inventory.txt' | wc -l` → expect **43**.

---

## Summary by category

| Category | Count | Location |
|---|---|---|
| Product photography | 9 | `company/brand/assets/images/photography/product/` |
| Lifestyle / in-use | 13 | `company/brand/assets/images/photography/lifestyle/` |
| Graphics & composites | 9 | `company/brand/assets/images/graphics/` (includes temperature chart) |
| AI-generated (archive) | 7 | `company/brand/assets/images/photography/ai-generated/` |
| Icons | 3 | `company/brand/assets/images/icons/` |
| Logo | 2 | `company/brand/assets/logos/` — SVG (primary) + deprecated raster |

---

## Maintenance scripts

```bash
./scripts/discover-assets.sh   # Re-scan 13 site pages → company/brand/assets/cdn-inventory.txt
./scripts/download-assets.sh   # Discover + download any missing files
```

---

## Logo

| Local path | Background | Description |
|---|---|---|
| `company/brand/assets/logos/Artboard 2.pdf` | — | **Client-supplied original** — source logo artwork (archive; use SVG for production) |
| `company/brand/assets/logos/artboard-2.svg` | Black plate | Primary wordmark — default export |
| `company/brand/assets/logos/artboard-2-on-dark.svg` | Transparent | Orange `#F9A027` + cream — dark navy / charcoal |
| `company/brand/assets/logos/artboard-2-reverse.svg` | Transparent | White + cream — brand orange backgrounds |
| `company/brand/assets/logos/artboard-2-icon.svg` | Transparent | Cropped wordmark — social avatars (min 48px) |
| `company/brand/assets/logos/artboard-2-icon-reverse.svg` | Transparent | Icon for orange backgrounds |
| `company/brand/assets/logos/Screenshot_2025-12-03_at_14.05.26.png` | — | Site header raster — **deprecated** |

**Routing:** See `design.md` § Logo Usage for which file per background.

---

## Photography — product

| Local path | Dimensions | Content |
|---|---|---|
| `company/brand/assets/images/photography/product/AFB_EDIT_1_DSCF1530.jpg` | 3000×1688 | Product pack shot — hero |
| `company/brand/assets/images/photography/product/AFP_EDIT_2_DSCF1444.jpg` | 3000×1688 | Product angle shot |
| `company/brand/assets/images/photography/product/probefront.jpg` | 1000×1000 | Front-facing product |
| `company/brand/assets/images/photography/product/probe_close_up.jpg` | 3000×1688 | Close-up product shot |
| `company/brand/assets/images/photography/product/probe_with_box.jpg` | 3000×2004 | Product with packaging |
| `company/brand/assets/images/photography/product/IMG_4708.jpg` | 533×533 | Product detail |
| `company/brand/assets/images/photography/product/IMG_4709.jpg` | 500×500 | Product detail |
| `company/brand/assets/images/photography/product/IMG_6011.jpg` | 2412×2412 | Product in context |
| `company/brand/assets/images/photography/product/AirFryerLabel-JPG.jpg` | 2362×1772 | Product label / packaging |

---

## Photography — lifestyle / in-use

| Local path | Dimensions | Content |
|---|---|---|
| `company/brand/assets/images/photography/lifestyle/probe_haning_in_air_fryer.jpg` | 3000×2004 | Probe hanging on air fryer via hook |
| `company/brand/assets/images/photography/lifestyle/probe_corner_angle_on_airfryer_e56f2e92-16ac-4c0a-8798-c624110092b1.jpg` | 3000×2004 | Probe on air fryer corner |
| `company/brand/assets/images/photography/lifestyle/probewithsteak.png` | 1600×1600 | Probe with cooked steak |
| `company/brand/assets/images/photography/lifestyle/probe_with_rosemary.jpg` | 3000×2004 | Probe with food styling |
| `company/brand/assets/images/photography/lifestyle/probe_other_uses.png` | 1600×1600 | Multi-use (BBQ, oven, etc.) |
| `company/brand/assets/images/photography/lifestyle/IMG_4709_bac46713-ce44-43f4-834c-c2676f64a4da.jpg` | 500×500 | Lifestyle thumbnail |
| `company/brand/assets/images/photography/lifestyle/3522A2E9-6A4F-45A2-9307-317697FA7CDE.jpg` | 1536×1024 | iPhone lifestyle photo |
| `company/brand/assets/images/photography/lifestyle/40329D31-3E82-4121-9B92-442B2ABE5604.jpg` | 1317×879 | iPhone lifestyle photo |
| `company/brand/assets/images/photography/lifestyle/956465AE-03A1-4396-A829-2220EC91A177_31da94be-de29-43b9-b003-62fb02718905.jpg` | 1536×1024 | iPhone lifestyle photo |
| `company/brand/assets/images/photography/lifestyle/956465AE-03A1-4396-A829-2220EC91A177_64fd8cf0-82f6-4596-ad5a-dc54bc76a90e.jpg` | 1536×1024 | iPhone lifestyle photo |
| `company/brand/assets/images/photography/lifestyle/D95D9043-98C4-4CC1-A0DE-EDAB49E6A492.jpg` | 830×830 | Product/lifestyle photo |
| `company/brand/assets/images/photography/lifestyle/D95D9043-98C4-4CC1-A0DE-EDAB49E6A492_df9581e8-57fe-4cce-96d9-a42f72b5372b.jpg` | 1536×1024 | Product gallery image |
| `company/brand/assets/images/photography/lifestyle/DF459CA8-6B4B-457B-896F-A270C2905942.jpg` | 1536×1024 | Hero/banner lifestyle photo |

---

## Graphics — composites, guides, branded

| Local path | Dimensions | Content |
|---|---|---|
| `company/brand/assets/images/graphics/air_fryer_4_shot_guide.png` | 2048×2048 | 4-shot product + guide composite |
| `company/brand/assets/images/graphics/air-fryer-chart-final-preview.png` | 2362×1772 | Temperature guide (local only, not on CDN) |
| `company/brand/assets/images/graphics/reviews.jpg` | 885×839 | Customer reviews graphic |
| `company/brand/assets/images/graphics/Untitled_design_78.png` | 1250×1250 | Branded product graphic |
| `company/brand/assets/images/graphics/Untitled_design_78_49c1e9b3-77d4-4e17-95fc-db9b9390bcc1.png` | 1250×1250 | Branded product graphic (variant) |
| `company/brand/assets/images/graphics/Untitled_design_10_fe2ffce2-d18e-4220-abb1-ee6cb2a342c3.png` | 1875×1875 | Branded graphic |
| `company/brand/assets/images/graphics/Untitled_design_2.png` | 1875×1875 | Branded graphic |
| `company/brand/assets/images/graphics/Untitled_design_5.png` | 1875×1875 | Branded graphic |
| `company/brand/assets/images/graphics/Screenshot_16.png` | 920×682 | Temperature guide promo |

---

## Photography — AI-generated (archive only)

Do not use as primary reference for new brand assets.

| Local path | Dimensions | Notes |
|---|---|---|
| `company/brand/assets/images/photography/ai-generated/Gemini_Generated_Image_hc6vpjhc6vpjhc6v.png` | 1024×1024 | Older AI image |
| `company/brand/assets/images/photography/ai-generated/Gemini_Generated_Image_h18p7yh18p7yh18p.png` | 2048×2048 | Older AI image |
| `company/brand/assets/images/photography/ai-generated/gemini_air_fryer_image_no1.jpg` | 1200×896 | Older AI image |
| `company/brand/assets/images/photography/ai-generated/Gemini_Generated_Image_cuvthccuvthccuvt.png` | 2528×1684 | Current hero slider |
| `company/brand/assets/images/photography/ai-generated/Gemini_Generated_Image_kdfj6gkdfj6gkdfj.png` | 1024×1024 | Product gallery |
| `company/brand/assets/images/photography/ai-generated/Gemini_Generated_Image_vh3as1vh3as1vh3a.png` | 2048×2048 | Homepage collection |
| `company/brand/assets/images/photography/ai-generated/Gemini_Generated_Image_vi6w91vi6w91vi6w.png` | 2120×1984 | Feature section |

---

## Icons

| Local path | Dimensions | Content |
|---|---|---|
| `company/brand/assets/images/icons/icons8-stir-100.png` | 100×100 | Stir / cooking |
| `company/brand/assets/images/icons/icons8-air-quality-96.png` | 96×96 | Features |
| `company/brand/assets/images/icons/icons8-24-hours-day-support-100.png` | 100×100 | Support |

---

## Recommended reference images for AI generation

| Use case | File |
|---|---|
| Product shape | `company/brand/assets/images/photography/product/AFB_EDIT_1_DSCF1530.jpg` |
| Product close-up | `company/brand/assets/images/photography/product/probe_close_up.jpg` |
| Product front | `company/brand/assets/images/photography/product/probefront.jpg` |
| Hanging on air fryer | `company/brand/assets/images/photography/lifestyle/probe_haning_in_air_fryer.jpg` |
| Corner mount | `company/brand/assets/images/photography/lifestyle/probe_corner_angle_on_airfryer_e56f2e92-16ac-4c0a-8798-c624110092b1.jpg` |
| Food styling | `company/brand/assets/images/photography/lifestyle/probewithsteak.png` |
| Bundle composite | `company/brand/assets/images/graphics/air_fryer_4_shot_guide.png` |
| Reviews social proof | `company/brand/assets/images/graphics/reviews.jpg` |

---

## Pages scanned for discovery

Home, product page, about, contact, collections (all, frontpage, 3-in-1, kitchen-and-dining), blog index, and 4 blog posts. See `scripts/discover-assets.sh` for the full URL list.

If new images are added to Shopify, re-run `./scripts/download-assets.sh` to pick them up.
