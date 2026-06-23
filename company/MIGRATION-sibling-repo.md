# Migrating from ops_local to sibling_repo

Use this when you start with an external/managed site (`website.brand_source: ops_local`) and later build a website git repo for the client.

## Overview

1. Create the website repo (e.g. from astro-template) as a sibling of ops.
2. Copy brand docs and assets from ops into the website repo.
3. Flip `website.brand_source` to `sibling_repo`.
4. Update pointer files and archive the ops-local brand folder.

## Step-by-step

### 1. Create website repo

```text
client-sites/
├── {client}_ops/       ← existing
└── {client}_website/   ← new sibling
```

Bootstrap the website from your standard template. Do not delete ops.

### 2. Copy brand docs

| From (ops) | To (website) |
|------------|--------------|
| `company/brand/branding.md` | `project-core/brain/brand/branding.md` |
| `company/brand/voice.md` | `project-core/brain/brand/voice.md` |
| `company/brand/design.md` | `project-core/brain/design/design.md` |

Review and adapt for the website codebase (CSS tokens, Astro components, etc.).

### 3. Copy assets

| From (ops) | To (website) |
|------------|--------------|
| `company/brand/assets/logos/*` | `public/assets/logos/` |
| `company/brand/assets/images/*` | `public/assets/images/` |

Update any paths in `social/assets-manifest.md` to reference the website repo layout.

### 4. Update ops config

**`company/facts.yaml`:**

```yaml
website:
  url: https://example.com
  brand_source: sibling_repo
  platform: null
  repo:
    name: client_website
    relative_path: ../client_website
    absolute_path: null   # or full path on your machine
```

**`company/website-repo.yaml`:** switch to sibling-repo paths (see template comments).

### 5. Archive ops-local brand

Option A — delete `company/brand/` after verifying the website repo is complete.

Option B — replace `company/brand/README.md` with a pointer:

```markdown
# Brand — archived (sibling_repo mode)

Canonical brand now lives in ../client_website/project-core/brain/brand/
Migrated: YYYY-MM-DD
```

Remove duplicate asset files from ops to avoid drift.

### 6. Update social references

- Refresh `social/brand-references.md` quick tokens if needed.
- Confirm `./scripts/resolve-website-asset.sh` resolves against the website repo.

### 7. Verify

```bash
./scripts/lib/brand-source.sh   # should print brand_source=sibling_repo
./scripts/resolve-website-asset.sh logos/example-logo.png
```

## Reverse migration

Do not migrate from `sibling_repo` back to `ops_local` unless the website repo is being retired. If that happens, copy brand back into `company/brand/`, set `brand_source: ops_local`, and null out repo pointers.
