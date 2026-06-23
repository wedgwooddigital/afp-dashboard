# Brand & Toolbox migration — Air Fryer Probe

Migrate dashboard features from [`client_ops_template`](../../client_ops_template) into this repo **without overwriting or diluting** Air Fryer–specific brand rules (temps, bundle, logo SVG policy, banned words, follower-count ban).

**Canonical template plan:** `dashboard/PLAN-brand-toolbox.md` (architecture, phases, sync script behaviour).  
**This doc:** AFP content mapping, preserve rules, and ordered rollout.

---

## Current state (post-rename)

| Area | AFP (`air_fryer_dashboard`) | Template (`client_ops_template`) |
|------|----------------------------|----------------------------------|
| Dashboard app | Documents + Updates only (9 src files) | Brand + Toolbox nav, islands, sync hooks (22 src files) |
| `toolbox/` | **Missing** | Prompts, playbooks, templates, facts |
| `content/brand/`, `content/toolbox/` | **Missing** | Sync targets + README stubs |
| `company/brand/` | **Rich** — branding, design, voice, logos, photography | Stubs + `frame.md` |
| `company/website-repo.yaml` | ops_local paths set; **no `video_frame`** | Full doc map incl. `video_frame` |
| Sync script | **Missing** | `scripts/sync-dashboard-brand.sh` |
| Prebuild sync | **Missing** | `dashboard/package.json` → `prebuild` / `predev` |

**Brand source:** `website.brand_source: ops_local` — sync reads this repo, not Shopify.

---

## Non-negotiables (do not template-overwrite)

When copying template files or authoring `toolbox/` prompts, **preserve** these AFP rules everywhere they apply:

| Rule | Source | Dashboard impact |
|------|--------|------------------|
| Never retype "AIR FRYER" — SVG logos only | `AGENTS.md`, `design.md` | Asset gallery must link SVGs; no AI logo generation prompts |
| Chicken = **74°C**; no carry-over offsets | `temperature-guide.md`, chart PNG | Toolbox prompts and playbooks must cite 74°C not 72°C |
| Market **3-in-1** (probe + guide + hook); screwdriver in-box only | `product.md`, `brand-facts.yaml` | Facts sheet and caption prompts |
| Banned in brand copy: *revolutionary*, *game-changing* (*ultimate* OK) | `voice.md`, `brand-facts.yaml` | Context blocks in synced prompts |
| Never cite follower counts in new copy | `AGENTS.md` | Social prompts must not reference "300k" etc. |
| Dark Navy `#11151C` default; Brand Orange `#FD9E27` CTAs only | `design.md`, `branding.md` | ColorSwatch island tokens |

**Policy:** Template generic placeholders (`CLIENT_TRADING_NAME`, trades/services copy) must be **rewritten for AFP** before any `clientVisible: true` page ships.

---

## Source → dashboard routing (AFP)

| Ops source (edit here) | Dashboard section | Slug / notes |
|------------------------|-------------------|--------------|
| `company/brand/branding.md` | Brand | `guidelines` |
| `company/brand/design.md` | Brand | `design-system` |
| `company/brand/frame.md` | Brand | `video-and-motion` — **create** (video pitch phase) |
| `company/brand/assets/logos/*` | Brand | `/brand/assets/` via sync copy to `public/brand-assets/` |
| `company/brand/assets/images/` (subset) | Brand | Hero/lifestyle only — not full CDN dump |
| `company/brand/voice.md` | Toolbox | `voice` |
| `toolbox/facts.md` | Toolbox | `facts` — derive from `brand-facts.yaml` + `product.md` |
| `toolbox/prompts/social-captions.md` | Toolbox | AFP DTC captions (not trades template) |
| `toolbox/prompts/product-images.md` | Toolbox | **New** — distill from `creative/image-prompts.md` |
| `toolbox/prompts/temperature-tips.md` | Toolbox | **New** — from `social/templates.md` Template 1 |
| `toolbox/playbooks/social-post-workflow.md` | Toolbox | **New** — from `creative/generation-workflow.md` |
| `toolbox/templates/review-replies.md` | Toolbox | Adapt for Shopify/email tone |

**Stay ops-only (not auto-synced unless explicitly added):**

- `reference/` — scrape and FB archive; rewrite before any client visibility
- `creative/image-prompts.md` — full internal prompt library; sync **subset** to toolbox
- `social/templates.md` — layout specs; link from playbook, don't duplicate wholesale

---

## Phase checklist

### Phase 0 — Template port (infra, no client content)

Copy from template; **do not** replace existing `company/brand/*`:

1. `scripts/sync-dashboard-brand.sh` + confirm `scripts/lib/brand-source.sh` handles ops_local
2. Dashboard src delta:
   - `src/pages/brand/`, `src/pages/toolbox/`
   - `src/components/` (ColorPalette, AssetGrid, ProseCopy, …)
   - `src/lib/` (dashboard-nav, brand-assets, brand-colors, visibility)
   - Updated `content.config.ts`, `DashboardLayout.astro`, `dashboard.css`
3. `content/brand/README.md`, `content/toolbox/README.md`
4. `toolbox/` skeleton (README + placeholder files with `clientVisible: false`)
5. Wire `dashboard/package.json` sync scripts (match template)
6. Add `video_frame: company/brand/frame.md` to `company/website-repo.yaml`
7. Create stub `company/brand/frame.md` (video/motion — "TBC" until pitch approved)

**Exit:** `cd dashboard && npm run build` passes; Brand/Toolbox nav renders empty/stub pages.

### Phase 1 — AFP toolbox authoring

1. **`toolbox/facts.md`** — client-safe sheet: price, bundle, specs, USPs, banned words (from `brand-facts.yaml`)
2. **`toolbox/prompts/social-captions.md`** — replace template trades context with AFP voice block + 5–8 caption tasks (temp tips, bundle, founder trust)
3. **`toolbox/prompts/product-images.md`** — top 5 scene templates from `creative/image-prompts.md` with AFP product form-factor block
4. **`toolbox/prompts/temperature-tips.md`** — caption-only temperature posts; **74°C chicken** enforced
5. **`toolbox/playbooks/social-post-workflow.md`** — route: manifest → prompt → composite vs caption-only (`generation-workflow.md`)
6. Set `clientVisible: true` only on voice + facts + captions when ready for Ben

**Exit:** Sync produces AFP-specific toolbox pages; internal prompts stay `clientVisible: false`.

### Phase 2 — Brand pages live

1. Ensure `branding.md` and `design.md` frontmatter/sync metadata includes `clientVisible: true` when approved
2. Sync copies logos to `dashboard/public/brand-assets/` — verify all six SVG variants listed
3. Asset gallery: probe hero, chart preview, 4-shot composite (from `social/assets-manifest.md` picks)
4. ColorSwatch tokens match branding.md hex table

**Exit:** Ben can download logos and read guidelines from dashboard.

### Phase 3 — Deploy & handoff

1. Build + deploy to `afp-dashboard.netlify.app`
2. Smoke-test: nav, copy buttons, asset downloads, mobile, password gate
3. Optional: first `content/documents/` pitch (video or design) links from home metrics

---

## Files to merge carefully (manual review)

| Template file | Action |
|---------------|--------|
| `dashboard/src/config/site.ts` | **Merge** — keep AFP names/copy; add Brand/Toolbox nav keys from template |
| `AGENTS.md` | **Merge** — add toolbox routing rows; keep hard rules block unchanged |
| `company/content-policy.md` | Add Brand/Toolbox publish rows from template |
| `.gitignore` | Add generated `content/brand/*.md` policy if template gitignores sync output |

| AFP file | Action |
|----------|--------|
| `company/brand/*.md` | **Keep** — extend only; add optional YAML frontmatter for sync if needed |
| `creative/`, `social/` | **Keep** — source for toolbox distillation, not replacement |
| `dashboard/PLAN-brand-toolbox.md` | **Keep** — reference; mark AFP phases in `tasks.md` |

---

## Suggested port command sequence

From repo root (after template is committed):

```bash
# 1. Sync dashboard app files (preserve site.ts — diff first)
rsync -av --exclude='config/site.ts' \
  ../client_ops_template/dashboard/src/ dashboard/src/

# 2. Copy scripts and content stubs
cp ../client_ops_template/scripts/sync-dashboard-brand.sh scripts/
cp -R ../client_ops_template/content/brand ../client_ops_template/content/toolbox content/
cp -R ../client_ops_template/toolbox toolbox/

# 3. Merge package.json scripts (prebuild/predev/sync)
# 4. Manually merge site.ts, website-repo.yaml, AGENTS.md
# 5. Author AFP toolbox content (Phase 1)
cd dashboard && npm run build
```

Prefer **git diff review** over blind rsync for any file that exists in both repos.

---

## Risks (AFP-specific)

| Risk | Mitigation |
|------|------------|
| Template trades copy leaks into Ben's dashboard | Rewrite all `toolbox/prompts/*` context blocks; never ship template `CLIENT_*` placeholders visible |
| Temperature errors in synced prompts | Single source: `temperature-guide.md`; grep toolbox for 72°C before `clientVisible: true` |
| Huge asset sync | Sync logos + ~6 hero images only; full library stays in ops + manifest |
| `reference/facebook-posts/` published by mistake | Exclude from sync; content-policy row |

---

## Success criteria

- Dashboard shows Brand + Toolbox alongside Documents/Updates
- All visible pages use AFP voice, temps, and bundle facts
- Logo download works for official SVG set
- `AGENTS.md` hard rules unchanged in substance
- One `npm run build` runs sync then builds static site
