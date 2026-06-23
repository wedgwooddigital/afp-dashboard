# Client Site Notes — Out of Scope, For Ben

**Purpose:** Issues spotted on [airfryerprobe.com](https://airfryerprobe.com) during brand kit work (June 2026). Outside the brand kit project scope, but worth flagging for trust and conversion. Use as talking points — not instructions to fix unless Ben asks.

**Source:** `reference/site-content/` scrape + live site check (Jun 2026). Items below note **HTML vs visible** — scrapers can see theme config visitors do not.

---

## Clarifications (questions from brand kit review)

### Why was “ultimate” flagged in the brand kit?

The kit originally treated **ultimate** the same as *revolutionary* and *game-changing*: generic DTC hype that can undermine the “precision instrument” positioning (credible, calm, spec-led).

**Update (Jun 2026):** Ben prefers *ultimate*. Removed from banned words in `company/brand/voice.md`. Still fine for blog/SEO titles (already in use). *Revolutionary* and *game-changing* remain discouraged in **brand-written** copy (OK in customer quotes).

---

### Where is “game changer” used?

| Location | Type | Issue? |
|----------|------|--------|
| [Homepage testimonials](site-content/pages/home.md) — Olivia quote | **Customer testimonial** | No — attributed review: “This probe is a game changer—no more dry chicken!” |
| [Product page testimonials](site-content/pages/product.md) — “### Game changer” block | **Testimonial-style** | Low — reads like a review section heading + quote |
| [About page](site-content/pages/about.md) — “### Game changer” | **Testimonial-style** | Low — same pattern as product page |
| [Blog: 5 must-have accessories](site-content/blog/5-must-have-air-fryer-accessories.md) — “**Why it’s a game-changer:**” | **Brand-written blog** | **Note for Ben** — brand voice in kit discourages *game-changing* in own copy; blog uses it anyway. Not urgent unless aligning all copy to one voice. |
| Brand kit `company/audience.md` | Internal example | Suggests testimonial-led angle: “Game changer — no more dry chicken” (quoting customer theme, not brand headline) |

**Summary:** On the **live site**, *game changer* is mainly in **reviews** (fine). One **blog subheading** uses it in brand voice — optional consistency fix, not urgent.

---

### Where is “300k Facebook followers”?

| Layer | Detail |
|-------|--------|
| **HTML / theme config** | Present in page source — footer social link with text `300k Followers` (scrapers and accessibility tools pick this up) |
| **What visitors see** | **Not prominent** — buried in footer under “Follow Our Journey”, below fold; easy to miss behind age gate, cookie banner, and newsletter popup |

#### HTML detail (in page source)

Found on live site scrape (Jun 2026) and in [contact page extraction](site-content/pages/contact.md). Repeated in theme footer across pages (homepage, policies, blog, product — see `site-content/.raw/` scrapes).

**Footer section:** “Follow Our Journey” → Social Media

**Markdown equivalent from scrape:**

```markdown
[300k Followers](https://www.facebook.com/share/1ByHjNcvMR/?mibextid=wwXIfr)
[Instagram](https://www.instagram.com/airfryerprobe?igsh=enZqaGppa3RpeWl0)
```

| Field | Value |
|-------|-------|
| Link label (visible text / `aria-label`) | `300k Followers` |
| Destination URL | `https://www.facebook.com/share/1ByHjNcvMR/?mibextid=wwXIfr` |
| Instagram (same block) | `https://www.instagram.com/airfryerprobe` |
| Also on | [Contact page](https://airfryerprobe.com/pages/contact) under “### Social Media” |

**Why it showed up in the brand kit review:** Firecrawl and the June 2026 site extraction read full HTML, including footer markup. Accessibility tree on live homepage also lists a link named `300k Followers` (ref in footer, below “Follow Our Journey”).

**Why it is easy to miss visually:** Footer is far below the fold; age gate, cookie consent, and newsletter popup sit above it. Theme may render social links as icons with the follower count only in link text or `title` attribute — not in hero or body copy.

**Where to change in Shopify:** Theme customizer → Footer → “Follow Our Journey” / social links block.

**Verified count (Jun 2026, internal only):** The Air Fryer Probe brand Facebook page has **~80 followers** (client-confirmed; posts in `reference/facebook-posts/`). The theme’s “300k Followers” label is **wrong**.

**Advise Ben:** **Remove the follower count from the footer link** — use plain “Facebook” or an icon-only link. Reasons:
- The “300k” figure is incorrect and misleads scrapers and accessibility tools.
- The real count (~80) should **not** be shown either — a low number adds no marketing value.
- **Never cite follower counts** in site copy, ads, or social posts for this brand.

**Priority:** 🟡 **Recommend in client conversation** — quick theme footer fix; removes false social proof from HTML.

---

### Where is placeholder Shopify content?

| Location | HTML / scrape | What visitors actually see |
|----------|---------------|----------------------------|
| Homepage hero carousel | **“New Collection”** / **“Tell your campaign through images”** in page source ([home.md](site-content/pages/home.md)) | **Not visible on default view** — live hero shows *“Digital meat thermometer, Designed for use with air fryers”*. Placeholder text appears to be dormant carousel slides in theme config, not the slide visitors land on. |
| `/collections/kitchen-and-dining-example-products` | Theme demo collection in scrape | Only an issue if linked from nav or SEO — check whether customers can reach it |

#### HTML detail — homepage hero carousel (dormant slides)

Default Shopify theme placeholder copy, still present in **page HTML** but not the slide visitors land on. Extracted from [homepage scrape](site-content/pages/home.md) — pattern repeats for multiple carousel slides:

```markdown
## New Collection

Tell your campaign through images

[Shop now](https://airfryerprobe.com/#)

![slider image ...](https://airfryerprobe.com/cdn/shop/files/Gemini_Generated_Image_cuvthccuvthccuvt.png?...)
```

| Field | Value |
|-------|-------|
| Heading (placeholder) | `New Collection` |
| Subheading (placeholder) | `Tell your campaign through images` |
| CTA | `Shop now` → `https://airfryerprobe.com/#` (broken / no destination) |
| Alternate slide label in HTML | `New Arrivals` |
| Slide image used | `Gemini_Generated_Image_cuvthccuvthccuvt.png` (AI-generated hero asset) |
| **Active slide copy (what visitors see)** | `Digital meat thermometer, Designed for use with air fryers` → real product URL |
| Carousel controls in HTML | Previous / Next buttons present |

**Why it showed up in the brand kit review:** Scrapers flatten all carousel slides into markdown, so placeholder slides appear alongside real content. Looks like a live homepage error in text extraction; on site it is **dormant theme config**.

**Where to change in Shopify:** Online Store → Themes → Customize → Homepage → Slideshow / Hero banner section → delete or replace slides still titled “New Collection”.

#### HTML detail — demo collection (separate issue)

| Field | Value |
|-------|-------|
| URL | `https://airfryerprobe.com/collections/kitchen-and-dining-example-products` |
| Title in scrape | `Kitchen And Dining example products` |
| Placeholder hallmarks | “SALE UP TO 25% OFF”, “Online Exclusive”, default Shopify demo catalog |
| In main nav? | **No** — not in primary nav (Home, Shop, About, Contact, Blog) per [site overview](site-content/00-site-overview.md) |
| Risk | Low unless linked from footer, ads, or indexed by Google |

**Revised assessment (Jun 2026):** **Not a visible homepage problem** for normal browsing. Optional Shopify admin cleanup: remove unused carousel slides and demo collection so they cannot resurface in a future theme edit or confuse future scrapes/AI tools.

**Priority:** 🟢 Optional theme cleanup — not urgent.

---

### Bundle wording — why does the 3-in-1 split matter?

**On site today (homepage “What’s included”):** flat list — Probe, AAA Batteries, Mini screwdriver, Temperature guide, Universal Hook. No hierarchy.

**Brand kit (canonical):** Product is marketed as **3-in-1** — probe + magnetic temperature guide + adhesive hook. Batteries and mini screwdriver are **in-the-box** extras, not headline features (screwdriver = battery compartment access only).

| Why it matters | |
|----------------|---|
| **Conversion** | “3-in-1 + free guide + free hook” is a clear value story. A five-item bullet list reads like accessories, not a bundle. |
| **Consistency** | Product title says “+ FREE cooking temperature guide and self adhesive hook”; homepage list doesn’t lead with “3-in-1”. |
| **Marketing materials** | Social/ads should not lead with mini screwdriver; site currently gives it equal weight to the hook and guide. |
| **AI / future copy** | Without a rule, generators mix messages — “4-in-1”, “5 things in the box”, or wrong emphasis. |

**Not necessarily wrong on site** — the homepage list is accurate for unboxing. Suggestion: keep full list in **specs / what’s in the box**, lead hero and ads with **3-in-1**.

**Kit owner agreement (Jun 2026):** Batteries and mini screwdriver are nice **spec additions**, not marketing — they should not have equal weight to the hook and temperature chart. Captured in `company/product.md`.

**Related typo on homepage:** “**Temperatue** guide” → Temperature guide. **Confirmed visible** in “What’s Included” on live homepage. 🟡 Worth fixing in Shopify.

---

## HTML vs visible — quick reference

Items that exist in **page source / scrapes** but are **not prominent** to visitors. Documented so future scrapes and AI agents are not mistaken for live UX problems.

| Item | In HTML? | Visibly prominent? | Doc section |
|------|----------|-------------------|-------------|
| `300k Followers` footer link | Yes | No | [300k Facebook](#where-is-300k-facebook-followers) |
| `New Collection` carousel slides | Yes | No (dormant slides) | [Placeholder content](#where-is-placeholder-shopify-content) |
| `Temperatue guide` typo | Yes | **Yes** | [Bundle wording](#bundle-wording--why-does-the-3-in-1-split-matter) |
| Demo collection URL | Yes (page exists) | Only if visited directly | [Placeholder content](#where-is-placeholder-shopify-content) |

---

## Follow-up checklist (for Ben / Shopify)

Outside brand kit scope — track here for client conversations.

| Priority | Item | Where | Suggested action |
|----------|------|-------|------------------|
| 🟡 Soon | “Temperatue guide” typo | Homepage What’s Included | Fix spelling in Shopify — **visible to visitors** |
| 🟢 Optional | Dormant carousel slides | Theme editor / homepage slider | Remove unused “New Collection” slides from config (in HTML, not visible) |
| 🟡 Soon | “300k Followers” footer link label | Theme footer settings | **Remove follower count** — use “Facebook” or icon only; count is wrong (~80 actual) and should not be displayed |
| 🟢 Optional | Demo collection | `/collections/kitchen-and-dining-example-products` | Delete if linked anywhere |
| 🟢 Optional | Blog “game-changer” subheading | Accessories blog post | Align with voice or leave as casual blog tone |
| 🟢 Optional | Homepage what’s included hierarchy | Homepage | Lead with 3-in-1 in hero; flat list OK for unboxing (kit agreement logged) |
| ✅ Done | Bundle marketing split | Brand kit | 3-in-1 for marketing; batteries + screwdriver = specs only |

---

## Brand kit decisions logged here

| Date | Topic | Decision |
|------|-------|----------|
| Jun 2026 | “Ultimate” in brand voice | **Allowed** — client preference; removed from banned words |
| Jun 2026 | “Game changer” | OK in **customer testimonials**; avoid in **brand-written** headlines (blog exception optional) |
| Jun 2026 | Bundle marketing | 3-in-1 = probe + guide + hook; batteries + screwdriver = specs only, not equal weight to hook/chart |
| Jun 2026 | Facebook follower count in footer | **Remove from theme HTML** — “300k” is wrong; real ~80; never display or cite follower counts in marketing |
| Jun 2026 | Placeholder carousel slides | In HTML/theme config, not visibly prominent — optional cleanup |
