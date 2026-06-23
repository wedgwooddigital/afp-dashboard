# Migrating a brand kit repo to ops_local ops

Use this when an existing workspace is a **brand kit / AI content brain** (not built on `client_ops_template`) and you want to align it with the standard ops layout without losing brand research.

**Worked example:** [`air_fryer_ops` → `air_fryer_ops`](../../air_fryer_ops/tasks.md) — full audit, decisions, and phased checklist for Air Fryer Probe.

## When this applies

| Signal | Ops mode |
|--------|----------|
| You did **not** build the client's website | `website.brand_source: ops_local` |
| Live site on Shopify, Squarespace, etc. | `website.platform` set; site is reference only |
| Brand docs and assets live in the ops repo | Canonical under `company/brand/` |
| Future website build possible | Later: `MIGRATION-sibling-repo.md` |

Do **not** use `bootstrap-ops.sh` on a non-empty repo — copy the template skeleton in place instead.

## What changes

| Brand kit (typical) | Ops template |
|---------------------|--------------|
| `company/brand/design.md` | `company/brand/design.md` |
| `company/brand/voice.md` | `company/brand/voice.md` |
| Root `assets/` | `company/brand/assets/` + `social/assets-manifest.md` |
| `ai/` prompts and templates | `creative/` + `social/` |
| Custom `company/facts.yaml` | Split: ops `company/facts.yaml` + `company/brand-facts.yaml` |
| `AGENTS.md` (brand-only) | Template `AGENTS.md` + brand pointers |
| No deliverables index | `creative/deliverables/` records |
| No pitch pipeline | `marketing/campaigns/`, `creative/video/`, `content/documents/` |

Keep unchanged where possible: `reference/`, existing `company/product.md`-style docs, git history.

## Migration phases (summary)

1. **Decisions** — naming, asset git policy, facts split, dashboard timing, deliverables inventory
2. **Rename** — `{client}_probe_cursor` or `{client}_brand` → `{client}_ops`
3. **Skeleton** — copy missing template folders (`dashboard/`, `content/`, domain dirs, scripts)
4. **Relocate brand** — move design, voice, assets into `company/brand/`; update paths
5. **Facts** — ops-template `company/facts.yaml` + preserve rich brand YAML separately
6. **Deliverables** — index past creative work in `creative/deliverables/`
7. **Pitch / tasks** — populate `tasks.md` and campaign folders
8. **GitHub / dashboard** — when client-visible output is ready

## After migration

- [ ] `website.brand_source: ops_local` in `company/facts.yaml`
- [ ] `cd dashboard && npm run build` passes
- [ ] `./scripts/resolve-website-asset.sh` works for ops_local paths
- [ ] `tasks.md` replaces ad-hoc goal/review docs
- [ ] Grep: no stale paths to old `assets/`, root `design.md`, or old folder name

## Related

| Doc | Purpose |
|-----|---------|
| [MIGRATION-dashboard-naming.md](./MIGRATION-dashboard-naming.md) | Older ops repos with `reports/` naming |
| [MIGRATION-sibling-repo.md](./MIGRATION-sibling-repo.md) | When you later build a website git repo |
| [content-policy.md](./content-policy.md) | What lives where (`ops_local` section) |
| `./scripts/bootstrap-ops.sh` | **New empty** ops repos only |
