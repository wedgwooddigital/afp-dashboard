# Content Policy — What Lives Where

Read `company/facts.yaml` → `website.brand_source` before deciding where content belongs.

This client uses **`ops_local`** — canonical brand lives in `company/brand/`. The live Shopify site is reference only.

---

## Canonical in ops repo (including brand)

Use for **all new assets** — social posts, ads, captions, image prompts, email, packaging copy, and future website UI.

| Path | Purpose |
|------|---------|
| `company/brand/design.md` | Visual identity, colours, typography, Do's and Don'ts |
| `company/brand/voice.md` | Tone, taglines, copy patterns, testimonials |
| `company/brand/branding.md` | Colour/typography summary for quick reference |
| `company/` | Product, audience, temperatures, trust, overview |
| `company/brand-facts.yaml` | Machine-readable price, URLs, specs, bundle, banned words |
| `creative/` | Image prompts, generation workflows |
| `social/templates.md` | Social layout specs for compositing |
| `social/assets-manifest.md` | Asset inventory, counts, photography references |
| `company/brand/assets/logos/artboard-2.svg` | Logo (never retype wordmark) |
| `company/brand/assets/images/graphics/air-fryer-chart-final-preview.png` | Definitive temperature chart |

**If canonical docs conflict**, priority order:

1. `company/brand-facts.yaml` (price, URLs, specs, bundle, banned words)
2. `company/temperature-guide.md` + definitive chart PNG (temperatures)
3. `company/product.md` (product facts, bundle structure)
4. `company/brand/voice.md` (tone, banned words)
5. `company/brand/design.md` (visual rules)
6. `social/assets-manifest.md` (asset counts and paths)

Ops routing and client contacts: `company/facts.yaml`.

---

## Reference (legacy snapshots)

### `reference/site-content/`

June 2026 scrape of airfryerprobe.com. Preserves what the live Shopify site said at extraction time.

### `reference/facebook-posts/`

Published Facebook posts — brand page (`posts/`) and Ben Cribb personal page (`personal/`). Input for rewriting, not output.

### Use reference for

- Website redesign pitches and wireframes
- Content migration planning (“what pages exist?”)
- Auditing the live site against the brand kit
- Studying Ben's published social voice (rewrite to canonical)
- Raw testimonial text (verify, then rewrite)

### Do not use reference for

- Social captions, ad copy, or email
- Voice, tone, or tagline selection
- Product specifications or bundle marketing
- Temperature values
- Asset counts
- Follower counts (theme “300k Followers” is wrong — never cite)
- Unverified claims (`reference/CLIENT-SITE-NOTES.md`)

**Rule:** Reference copy is input for rewriting. Always rewrite to `company/` and `creative/` standards before publishing.

---

## Known conflicts (reference vs canonical)

| Topic | Reference (site scrape) | Canonical (use this) |
|-------|-------------------------|----------------------|
| Bundle marketing | Homepage flat 5-item list | 3-in-1: probe + guide + hook (`product.md`) |
| Mini screwdriver | Listed on homepage | In-box / specs only — not marketing |
| Chicken temp | May vary in blog prose | **74°C** per chart (`temperature-guide.md`) |
| Photography | Mixes AI and real | Real-first for new assets |
| Social proof | “300k Followers” in theme | **Wrong** — never cite follower counts |
| Placeholder content | Theme demo collections | Ignore — not real brand content |

When in doubt: **canonical wins.**

---

## Food safety and temperature content

- All protein temperatures must match `company/temperature-guide.md` and the definitive chart PNG.
- Use UK °C, FSA-aligned minimums.
- No carry-over pull temperatures (e.g. “pull at 72°C”) unless added to the canonical guide.
- Chicken = **74°C**.

---

## Testimonials and customer quotes

- Approved quotes: `company/brand/voice.md`
- Customer quotes may use banned brand words (e.g. “game changer”) — attribute clearly.
- Do not fabricate testimonials.

---

## Ops domains (non-brand)

| Content | Location |
|---------|----------|
| IT inventory, runbooks | `it/` |
| SEO strategy, GBP, reviews | `seo/` |
| Marketing campaigns, analytics | `marketing/` |
| Social drafts and output | `social/drafts/`, `social/output/` |
| Creative briefs, deliverables | `creative/` |
| Billing | `billing/` |
| Client dashboard | `content/documents/`, `content/updates/` |
| Backlog | `tasks.md` |

Website code and Shopify changes are proposed here and implemented on the platform after approval — not deployed from this repo.

---

## Maintenance

| When | Action |
|------|--------|
| Live site changes significantly | Re-scrape → `reference/site-content/`; update canonical if facts changed |
| Product or bundle changes | Update `company/product.md` and `company/brand-facts.yaml` |
| New banned word or voice rule | Update `company/brand/voice.md` and `AGENTS.md` |
| Temperature chart redesign | Replace PNG, update `temperature-guide.md` |
| New brand asset | Update `social/assets-manifest.md` |
