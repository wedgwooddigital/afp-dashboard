# Toolbox — dashboard publish target (generated)

Markdown files in this folder are **generated** by `./scripts/sync-dashboard-brand.sh`. Do not edit by hand.

## Edit sources instead

| Dashboard page | Ops source |
|----------------|------------|
| Voice | `company/brand/voice.md` |
| Facts sheet | `toolbox/facts.md` |
| Prompts | `toolbox/prompts/*.md` |
| Playbooks | `toolbox/playbooks/*.md` |
| Templates | `toolbox/templates/*.md` |

Authoring conventions: [`toolbox/README.md`](../toolbox/README.md).

## Visibility

Only pages with `clientVisible: true` that pass the tier filter are built. Configure tier in `company/facts.yaml` → `dashboard.tier` (`all` | `diy` | `managed`).

## Git

Synced `*.md` files (including subfolders) are gitignored. Only this README is committed in `content/toolbox/`.

## Build

```bash
./scripts/sync-dashboard-brand.sh
cd dashboard && npm run build
```

See [`dashboard/PLAN-brand-toolbox.md`](../dashboard/PLAN-brand-toolbox.md).
