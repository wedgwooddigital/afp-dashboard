# Social media

Strategy, brand references, drafts, and generated output for social channels.

## Brand source

Check `company/facts.yaml` → `website.brand_source` before starting social work:

| `brand_source` | Read brand from |
|----------------|-----------------|
| `sibling_repo` | Sibling website repo (see `company/website-repo.yaml`) |
| `ops_local` | `company/brand/` in this repo |

Quick tokens: [brand-references.md](./brand-references.md)  
Asset inventory: [assets-manifest.md](./assets-manifest.md)

## Folders

| Folder | Purpose |
|--------|---------|
| `drafts/` | Copy drafts awaiting approval |
| `output/` | Finished graphics and exports (not canonical source files) |

## Workflow

1. Read voice doc and brand-references
2. Resolve source assets via `./scripts/resolve-website-asset.sh`
3. Draft copy in `drafts/`
4. Export graphics to `output/`
5. Publish after approval (manual or platform tooling)
