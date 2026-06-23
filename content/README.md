# Client dashboard — content glossary

Canonical reference for **what the client dashboard is** and **where content lives** in this repo.

## Vocabulary

| Term | Meaning |
|------|---------|
| **Dashboard** | The whole password-protected client product (Netlify site + Astro build in `dashboard/`). Not the public website. |
| **Document** | A long-form client-readable write-up published on the dashboard under **Documents** (`/documents/`). Audits, comparisons, roadmaps, migration summaries, etc. |
| **Update** | A short progress note published under **Updates** (`/updates/`). |
| **Report** | A *type* of document — use in titles and prose when accurate. Do **not** use for folder names or the build pipeline. |

## Content on the dashboard today

```
Dashboard (password-protected Netlify site)
├── Documents     ← source: content/documents/
└── Updates       ← source: content/updates/
```

Documents are the main content type today. More dashboard sections (e.g. tasks, files, billing snapshots) may be added later — each will get its own `content/<section>/` folder and nav entry.

## Two layers in the ops repo

| Layer | Where | Purpose |
|-------|-------|---------|
| **Dashboard content** | `content/documents/`, `content/updates/` | Single canonical source for client-visible markdown |
| **Domain working files** | `it/`, `seo/`, `marketing/`, etc. | Summaries, project notes, runbooks — link to dashboard documents, do not duplicate them |

## Publishing pipeline

1. Write markdown in `content/documents/` (document) or `content/updates/` (update).
2. Set `clientVisible: true` only when ready for the client to see it.
3. Build: `cd dashboard && npm run build`
4. Deploy the Netlify dashboard site (password-protected).

See [`dashboard/README.md`](../dashboard/README.md) for build/deploy detail.

## Conventions by folder

| Folder | Dashboard section | README |
|--------|-------------------|--------|
| `content/documents/` | Documents | [`content/documents/README.md`](documents/README.md) |
| `content/updates/` | Updates | [`content/updates/README.md`](updates/README.md) |

## Further reading

| Doc | Purpose |
|-----|---------|
| [`dashboard/README.md`](../dashboard/README.md) | Local dev, build, deploy |
| [`company/content-policy.md`](../company/content-policy.md) | What lives here vs website repo |
| [`AGENTS.md`](../AGENTS.md) | Agent routing and hard rules |
| [`HOW-IT-WORKS.md`](../HOW-IT-WORKS.md) | Human onboarding |
