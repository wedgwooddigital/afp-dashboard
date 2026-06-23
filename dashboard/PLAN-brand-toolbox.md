# Build plan — Brand & Toolbox dashboard sections

Password-protected client dashboard extension: **Brand** (visual identity) and **Toolbox** (voice, prompts, templates, playbooks). Static delivery only — Astro pages, islands, embedded video. No live AI tooling.

**Status:** Approved direction — implement fully in this template, then validate in a test ops project, then migrate existing clients.

## Decisions (locked)

| Topic | Decision |
|-------|----------|
| Nav | **Option B** — two top-level items: **Brand**, **Toolbox** (alongside Home, Documents, Updates) |
| Canonical → dashboard | **Build-step sync** — prebuild script resolves sources and writes dashboard content collections |
| Scope | Build **complete template skeleton** now; test project populates real content; existing clients follow |
| Visibility | `clientVisible` on every synced page; optional future `tier` field for DIY vs managed pricing |
| Prompts | Versioned (`updated`, `changelog` in frontmatter) |
| `sibling_repo` | Sync reads paths from `company/website-repo.yaml`; summaries/assets copied into dashboard build output |
| `ops_local` | Sync reads `company/brand/` and ops-local toolbox sources |

## Architecture

```text
Ops repo (source of truth)                    Build (prebuild)                 Dashboard (Astro)
────────────────────────────                  ────────────────                 ───────────────────

company/brand/                                scripts/sync-dashboard-brand.sh
  branding.md        ──────────────────────►  content/brand/*.md
  design.md                                   + public/brand-assets/*
  frame.md

company/brand/voice.md  ── (Toolbox nav) ──►  content/toolbox/voice.md

toolbox/                                        (same script or sibling)
  prompts/*.md       ──────────────────────►  content/toolbox/prompts/*.md
  playbooks/*.md                              content/toolbox/playbooks/*.md
  templates/*.md                              content/toolbox/templates/*.md
  facts.md                                    content/toolbox/facts.md

sibling_repo: website-repo.yaml doc paths     resolve via brand-source.sh
ops_local:    company/brand/ paths

creative/, social/  (ops working notes)       NOT auto-synced unless path listed in toolbox/
```

**Two layers stay explicit:**

1. **Ops sources** — where agents and you edit (`company/brand/`, `toolbox/`, `creative/`, `social/`).
2. **Dashboard publish** — generated under `content/brand/` and `content/toolbox/` (gitignored or committed as build artefacts — see Phase 1 note).

Recommended: **gitignore synced output**, commit **source stubs only**; CI/local `npm run build` always runs sync first. Template ships example sources so a test project builds without a sibling website repo.

## Folder structure (new)

```text
company/brand/
  branding.md          # existing — extend stub
  voice.md             # existing — synced to Toolbox
  design.md            # existing — extend stub
  frame.md             # NEW — video/motion guidelines
  assets/              # existing

toolbox/               # NEW — ops-local toolbox sources (not client-facing until synced)
  README.md
  facts.md             # client-safe services, areas, USPs
  prompts/
    README.md
    social-captions.md # example with versioning + clientVisible
  playbooks/
    README.md
    job-photo-to-post.md
  templates/
    README.md

content/               # dashboard publish targets (sync output)
  brand/
    README.md          # explains generated files
  toolbox/
    README.md

dashboard/
  src/pages/brand/...
  src/pages/toolbox/...
  src/components/      # islands: ColorSwatch, CopyPrompt, AssetGrid
  scripts/             # optional: sync invoked from package.json prebuild

scripts/
  sync-dashboard-brand.sh   # NEW — resolves sources, writes content + copies assets
  lib/brand-source.sh       # existing — reuse
```

## Build-step sync (`scripts/sync-dashboard-brand.sh`)

Runs before `astro build` (and `astro dev` via `npm run dev` wrapper or documented two-step).

**Inputs:**

- `company/facts.yaml` → `website.brand_source`
- `company/website-repo.yaml` → doc paths (`brand_guidelines`, `brand_voice`, `design_system`, …) and asset roots
- `toolbox/` tree at ops repo root
- Add `frame.md` path to `website-repo.yaml` docs map: `video_frame: company/brand/frame.md` (ops_local) or website equivalent

**Behaviour:**

1. Resolve repo root (ops vs sibling) using `scripts/lib/brand-source.sh`.
2. For each mapped brand doc, read source markdown:
   - If source has YAML frontmatter, merge with sync defaults.
   - Else inject frontmatter: `title`, `description`, `order`, `clientVisible`, `updated` (from source file mtime or explicit field).
3. Write to `content/brand/<slug>.md` or `content/toolbox/<slug>.md` per routing table below.
4. Copy logo/image assets to `dashboard/public/brand-assets/` (flatten or preserve subpaths; reference in pages via `/brand-assets/...`).
5. Fail build with clear error if required source missing in **non-template** mode; template mode uses stubs and warns only.

**Routing table (source → dashboard section):**

| Source | Nav section | Slug |
|--------|-------------|------|
| `branding.md` | Brand | `guidelines` (hub) or `colours-and-logos` |
| `design.md` | Brand | `design-system` |
| `frame.md` | Brand | `video-and-motion` |
| Asset manifest / gallery config | Brand | `assets` (generated index or Astro page) |
| `voice.md` | Toolbox | `voice` |
| `toolbox/facts.md` | Toolbox | `facts` |
| `toolbox/prompts/*.md` | Toolbox | `prompts/<id>` |
| `toolbox/playbooks/*.md` | Toolbox | `playbooks/<id>` |
| `toolbox/templates/*.md` | Toolbox | `templates/<id>` |

**Optional:** `company/facts.yaml` → `dashboard.tier: diy | managed | internal` passed into sync to filter pages when `tier` frontmatter is added later.

## Astro content collections

Extend `dashboard/src/content.config.ts`:

**`brand` collection**

```yaml
title: string
description: optional
order: number default 0
clientVisible: boolean default false
updated: coerce.date
sourcePath: optional string   # provenance for “edit in ops” footer
```

**`toolbox` collection**

```yaml
title: string
description: optional
kind: enum prompts | playbooks | templates | reference
order: number default 0
clientVisible: boolean default false
updated: coerce.date
changelog: optional string
tier: optional enum diy | managed | all default all
sourcePath: optional string
videoUrl: optional string     # embedded Loom/YouTube
```

Filter at query time: `clientVisible && (tier === 'all' || tier === siteTier)`.

## Dashboard UI

### Nav (`site.ts` + `DashboardLayout.astro`)

| Label | Path | `activeSection` |
|-------|------|-----------------|
| Brand | `/brand/` | `brand` |
| Toolbox | `/toolbox/` | `toolbox` |

Update home intro copy and metric cards to mention Brand & Toolbox.

### Pages

| Route | Purpose |
|-------|---------|
| `/brand/` | Index — cards for guidelines, design, video, assets |
| `/brand/[id]/` | Render synced markdown + islands |
| `/brand/assets/` | Logo/image grid with download links (may be special page reading manifest) |
| `/toolbox/` | Index — grouped by `kind` |
| `/toolbox/[...id]/` | Nested slugs for prompts/playbooks/templates |

Reuse document `prose` styling; add `.prompt-block` and `.copy-button` styles.

### Astro islands (client:load where needed)

| Component | Used on | Behaviour |
|-----------|---------|-----------|
| `ColorSwatch` | Brand guidelines | Parse hex from content or frontmatter tokens; show swatch + copy hex |
| `CopyPrompt` | Toolbox prompts | Copy full prompt text to clipboard |
| `AssetDownload` | Brand assets | Thumbnail + download link from `/brand-assets/` |

Embedded video: standard markdown iframe or `videoUrl` frontmatter → responsive embed component.

## Template example content (reference pilot set)

Ship stubs so the template builds and demonstrates structure:

**Brand**

1. Colours & logos — extend `company/brand/branding.md` with example tokens + `clientVisible: true` after sync defaults
2. Design system — `company/brand/design.md` stub filled
3. Video & motion — new `company/brand/frame.md` stub
4. Assets — placeholder logos in `company/brand/assets/logos/` + manifest snippet

**Toolbox**

1. Voice — `company/brand/voice.md` stub
2. Social caption prompts — `toolbox/prompts/social-captions.md` (5–10 example prompts, versioning block)
3. Playbook — `toolbox/playbooks/job-photo-to-post.md`
4. Facts sheet — `toolbox/facts.md` from facts.yaml placeholders
5. Optional embed placeholder in one playbook (`videoUrl` commented in frontmatter)

## Documentation updates (same PR series)

| File | Change |
|------|--------|
| `content/README.md` | Brand + Toolbox vocabulary, sync pipeline |
| `content/brand/README.md`, `content/toolbox/README.md` | Generated vs source |
| `toolbox/README.md` | Authoring conventions, prompt versioning |
| `company/brand/README.md` | Add `frame.md` |
| `company/website-repo.yaml` | Add `video_frame` doc path |
| `company/content-policy.md` | Brand/Toolbox publish rows |
| `dashboard/README.md` | Nav, sync, build commands |
| `AGENTS.md` | Route toolbox tasks |
| `tasks.md` | Phase checklist |
| `HOW-IT-WORKS.md` | Client-facing summary |

## Implementation phases

### Phase 1 — Sources & sync script

- [ ] Add `company/brand/frame.md` stub
- [ ] Add `toolbox/` tree with README + example files (pilot set above)
- [ ] Extend `company/website-repo.yaml` with `video_frame` path
- [ ] Implement `scripts/sync-dashboard-brand.sh` (ops_local + sibling_repo)
- [ ] Wire `dashboard/package.json`: `"prebuild": "node ../scripts/sync-dashboard-brand.sh"` or bash from repo root
- [ ] Document gitignore policy for `content/brand/*.md` (generated) vs committed READMEs

**Exit:** `./scripts/sync-dashboard-brand.sh && cd dashboard && npm run build` succeeds on template stubs.

### Phase 2 — Collections & routes

- [ ] Add `brand` and `toolbox` collections to `content.config.ts`
- [ ] Create index + `[id]` pages for Brand and Toolbox
- [ ] Extend `DashboardLayout` nav and `activeSection` type
- [ ] Update `site.ts` paths, labels, home copy

**Exit:** Synced example pages render at `/brand/` and `/toolbox/`.

### Phase 3 — Islands & assets

- [ ] `ColorSwatch`, `CopyPrompt`, asset gallery page
- [ ] Copy assets to `dashboard/public/brand-assets/` in sync script
- [ ] Styles for prompt blocks, swatches, embeds

**Exit:** Copy-to-clipboard and colour swatches work on example pages.

### Phase 4 — Visibility & versioning

- [ ] Enforce `clientVisible` filter on all brand/toolbox queries
- [ ] Display `updated` + `changelog` on toolbox pages
- [ ] Add `tier` to schema (optional, default `all`) — filter hook ready, no pricing UI yet
- [ ] Example of `clientVisible: false` prompt in template (comment in README)

**Exit:** Hidden pages absent from nav and static paths.

### Phase 5 — Docs & agent routing

- [ ] Update all docs listed above
- [ ] `tasks.md` phase items → Done as completed
- [ ] `MODEL-GUIDE.md` one-line pointer

**Exit:** New ops project can follow docs without this plan.

## Rollout after template

### Step A — Test ops project

1. Clone/bootstrap template to `{client}_ops_test` (or dedicated test repo).
2. Set `ops_local`, replace placeholders, fill pilot set with realistic fake client.
3. Add sample logos, one Loom embed URL, 10 prompts.
4. Run full build + deploy to Netlify test site.
5. Checklist: nav, copy buttons, downloads, mobile, print, password gate.

### Step B — Existing clients

For each client ops repo:

1. Pull template changes (Brand/Toolbox skeleton + sync).
2. Map `brand_source`; confirm `website-repo.yaml` paths.
3. Migrate or author `frame.md`, `toolbox/prompts/`, playbooks.
4. Set `clientVisible` per tier/agreement.
5. Build, deploy dashboard, send client walkthrough.

Keep **Documents/Updates** unchanged; Brand/Toolbox are additive.

## Later additions (already in `tasks.md`)

Not in Phase 1–5 — separate tasks when core sections ship:

- Printable PDF brand one-pager
- “Before you post” checklist (static + island)
- Industry glossary
- Photo release boilerplate
- Hashtag sets (maintain in `social/`, sync subset to Toolbox)

## Risks & mitigations

| Risk | Mitigation |
|------|------------|
| Sibling repo missing at build time | Sync warns; skip sibling-only sources or use ops fallbacks; document `WEBSITE_REPO_OVERRIDE` |
| Generated content drift in git | Gitignore sync output; never hand-edit `content/brand/*.md` |
| Large assets bloating dashboard | Sync only logos + selected images; link to full library in Documents if needed |
| Voice duplicated in brand vs toolbox | Single source `company/brand/voice.md`; sync writes once to `content/toolbox/` |

## Success criteria

- Template builds with zero client-specific data beyond placeholders.
- One command (`npm run build` from dashboard) syncs and produces Brand + Toolbox.
- Test project validates with fake content.
- Existing client migration path documented in under 30 minutes per client (content-dependent).
