# Air Fryer Probe — Client Ops

Operational workspace for **Air Fryer Probe** (Ben Cribb). UK DTC brand — 3-in-1 digital meat thermometer bundle for air fryer cooking.

**Live site:** [airfryerprobe.com](https://airfryerprobe.com) (Shopify — reference only)  
**Dashboard:** [air-fryer-ops.netlify.app](https://air-fryer-ops.netlify.app) (when deployed, password-protected)

## What's here

| Area | Purpose |
|------|---------|
| [`AGENTS.md`](./AGENTS.md) | Agent entry point — routing, hard rules |
| [`tasks.md`](./tasks.md) | Cross-domain backlog |
| [`company/`](./company/) | Client facts, product, voice, brand system |
| [`company/brand/`](./company/brand/) | Design system, logos, photography |
| [`creative/`](./creative/) | AI image prompts and generation workflow |
| [`social/`](./social/) | Social templates, drafts, asset manifest |
| [`reference/`](./reference/) | Site scrape, Facebook archive, client notes |
| [`content/`](./content/) | Client dashboard documents |
| [`dashboard/`](./dashboard/) | Astro dashboard build |

## Quick links for humans

1. **Brand colours/fonts?** → `company/brand/design.md`
2. **Writing copy?** → `company/brand/voice.md`
3. **Product specs?** → `company/product.md`
4. **Temperature tips?** → `company/temperature-guide.md`
5. **Social graphic layout?** → `social/templates.md`
6. **Product image prompt?** → `creative/image-prompts.md`
7. **Logo files?** → `company/brand/assets/logos/`

## Assets

Photography and graphics live in `company/brand/assets/images/`. Refresh from CDN:

```bash
./scripts/download-assets.sh
```

Inventory: `social/assets-manifest.md`

## For AI agents

Start with [`AGENTS.md`](./AGENTS.md) and [`tasks.md`](./tasks.md).

## Client context

Graphic design client. Past work includes logo system, magnetic temperature chart, social graphics. Current focus: video production pitch and further design work. Possible website rebuild later — see `reference/CLIENT-SITE-NOTES.md`.
