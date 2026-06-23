# Brand — dashboard publish target (generated)

Markdown files in this folder are **generated** by `./scripts/sync-dashboard-brand.sh` at build time. Do not edit them by hand — changes will be overwritten.

## Edit sources instead

| Dashboard page | Ops source |
|----------------|------------|
| Colours & logos | `company/brand/branding.md` (or sibling website path in `company/website-repo.yaml`) |
| Design system | `company/brand/design.md` |
| Video & motion | `company/brand/frame.md` |
| Logo/image downloads | `company/brand/assets/` (copied to `dashboard/public/brand-assets/`) |

Paths resolve via `company/facts.yaml` → `website.brand_source` and `company/website-repo.yaml`.

Only pages with `clientVisible: true` are built into static routes.

## Git

Synced `*.md` files are gitignored. Only this README is committed in `content/brand/`.

## Build

```bash
./scripts/sync-dashboard-brand.sh
cd dashboard && npm run build   # prebuild runs sync automatically
```

See [`dashboard/PLAN-brand-toolbox.md`](../dashboard/PLAN-brand-toolbox.md).
