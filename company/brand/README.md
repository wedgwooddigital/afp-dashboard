# Brand — ops-local canonical source

Use this folder when `company/facts.yaml` has `website.brand_source: ops_local`.

In that mode, brand guidelines, voice, design notes, and source assets live **here** — not in a sibling website git repo. The client's live website URL (Squarespace, WordPress, etc.) is reference only.

When `website.brand_source: sibling_repo`, canonical brand lives in the sibling website repo. See `company/website-repo.yaml` for paths. Do not treat this folder as authoritative in sibling mode.

## Files

| File | Purpose |
|------|---------|
| `branding.md` | Colours, typography, logo usage |
| `voice.md` | Tone of voice and copy rules |
| `design.md` | UI patterns (optional) |
| `assets/logos/` | Source logo files |
| `assets/images/` | Source photography and graphics |

## Upgrading to a website repo

When you later build a website for this client, see [MIGRATION-sibling-repo.md](../MIGRATION-sibling-repo.md).
