# Migrating existing ops repos — dashboard naming (Phases 2–4)

Use this when an ops repo still has `reports/` and `content/reports/` from before the dashboard vocabulary migration.

**New bootstraps** from this template already use `dashboard/` and `content/documents/` — no migration needed.

## What changes

| Old | New |
|-----|-----|
| `reports/` | `dashboard/` (Astro app) |
| `content/reports/` | `content/documents/` |
| Astro collection `reports` | `documents` |
| `getCollection("reports")` | `getCollection("documents")` |

Client URLs (`/documents/`, `/document/[id]/`) are unchanged.

## Automated migration

From the **target ops repo** (e.g. `rosenkelly_ops`):

```bash
../client_ops_template/scripts/migrate-dashboard-naming.sh
```

Or with an explicit path:

```bash
./scripts/migrate-dashboard-naming.sh /path/to/client_ops
```

The script:

1. `git mv reports dashboard` and `git mv content/reports content/documents` (when present)
2. Syncs dashboard app source from this template (preserves `dashboard/src/config/site.ts`)
3. Updates `netlify.toml`, `.gitignore`, and doc path references
4. Copies `content/README.md` if missing
5. Runs `npm run build` in `dashboard/`

## After migration — checklist

- [ ] `company/facts.yaml` → `urls.dashboard_config: dashboard/src/config/site.ts`
- [ ] Netlify site base directory = `dashboard` (or empty with root `netlify.toml`)
- [ ] Grep: no `content/reports/` or app-folder `reports/` left in docs
- [ ] `cd dashboard && npm run build` passes
- [ ] Deploy dashboard; smoke-test home, documents list, one document, updates
- [ ] Update any domain `deliverables/` indexes and inventory cross-links

## Rollout order

1. **`client_ops_template`** — canonical; commit and push first
2. **Per-client ops repos** — run migration script, then checklist above
3. **`jpf_ops`** — reference implementation (may already be migrated locally)
