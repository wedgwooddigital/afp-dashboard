# Site Content Extraction — airfryerprobe.com

Full text snapshot of the live Shopify site, extracted June 2026. Intended for **website redesign pitches**, content audits, and migration planning — separate from the brand kit in the repo root.

> **Not canonical.** Do not use this folder for new social copy, ads, voice, product facts, or temperatures. See [company/content-policy.md](../../company/content-policy.md).  
> **Client site issues** spotted during scrape: [CLIENT-SITE-NOTES.md](../CLIENT-SITE-NOTES.md)

## Start here

| Document | Purpose |
|---|---|
| [00-site-overview.md](./00-site-overview.md) | Business info, navigation, tech stack, pitch observations |
| [content-inventory.md](./content-inventory.md) | **Deduplicated copy** — unique headlines, features, FAQs, testimonials |
| [pages/](./pages/) | Page-by-page extractions (raw-ish, cleaned of footer noise) |
| [blog/](./blog/) | Full blog post text |
| [policies/](./policies/) | Legal pages |
| [collections/](./collections/) | Collection listing pages |

## How this was extracted

**Tool:** [Firecrawl](https://firecrawl.dev) CLI with `--only-main-content`  
**Processor:** `scripts/build-site-extraction.py` (strips footer/modals, dedupes testimonials)  
**Structured data:** Shopify product JSON API for canonical product copy and pricing

### Best practice for site snapshots

| Approach | When to use |
|---|---|
| **Firecrawl scrape** (`--only-main-content`) | Best default — JS-rendered Shopify, clean markdown, handles carousels |
| **Shopify JSON APIs** (`/products/{handle}.json`) | Canonical product title, description, price, images |
| **Firecrawl map + scrape** | Discover all URLs before extracting |
| **Firecrawl crawl** | Bulk extract when site structure is stable |
| **Manual content inventory** | Pitch decks — deduplicate theme repetition (see `content-inventory.md`) |

### Refresh the extraction

```bash
# 1. Scrape all pages (see scripts/build-site-extraction.py PAGE_META for URLs)
# 2. Rebuild cleaned markdown
python3 scripts/build-site-extraction.py
```

Raw unprocessed scrapes are kept in `.raw/` for diffing against future site changes.

## Site map (16 pages)

### Core pages
- [Homepage](pages/home.md) — `https://airfryerprobe.com/`
- [Product](pages/product.md) — 3-in-1 probe bundle
- [About](pages/about.md)
- [Contact](pages/contact.md)

### Collections
- [All products](collections/all.md)
- [Frontpage](collections/frontpage.md)
- [3-in-1 Air Fryer Essentials](collections/3-in-1-air-fryer-essentials-package.md)
- [Kitchen and Dining (example)](collections/kitchen-and-dining-example-products.md) — appears to be theme placeholder

### Blog (4 posts + index)
- [Blog index](blog/index.md)
- [Benefits of a cooking thermometer](blog/what-are-the-benefits-of-using-a-cooking-thermometer.md) — Jan 2026
- [Why pan frying is still essential](blog/why-the-frying-pan-is-still-essential-to-air-frying.md) — Jan 2026
- [5 must-have air fryer accessories](blog/5-must-have-air-fryer-accessories.md) — Feb 2026
- [Ultimate temperature chart 2026](blog/ultimate-air-fryer-temperature-chart-2026.md) — Feb 2026

### Policies
- [Privacy](policies/privacy-policy.md)
- [Refund](policies/refund-policy.md)
- [Terms](policies/terms-of-service.md)

## Known limitations

- **Carousel duplication:** Shopify theme repeats hero/slider content; see `content-inventory.md` for deduplicated copy
- **Placeholder content:** "New Collection / Tell your campaign through images" is unconfigured theme defaults
- **Example collection:** `kitchen-and-dining-example-products` is a Shopify theme demo collection
- **Price:** £23.99 (confirmed current price, June 2026)
- **Age gate:** Site has 18+ age confirmation modal
- **Blog author:** All posts by "ben cribb" — likely founder

## Related files

- Old single-file extraction: [../site-extraction.md](../site-extraction.md) (superseded)
- Brand kit: [../../company/overview.md](../../company/overview.md)
- Photography: [../../social/assets-manifest.md](../../social/assets-manifest.md)
