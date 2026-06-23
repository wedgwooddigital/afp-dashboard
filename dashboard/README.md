# Client dashboard

Password-protected static dashboard built from markdown in [`../content/documents/`](../content/documents/) (dashboard **Documents**) and [`../content/updates/`](../content/updates/) (**Updates**).

**Glossary:** [`../content/README.md`](../content/README.md)

**Template URL:** https://wdclientdashboard.netlify.app/

## Local development

```bash
npm install
npm run dev
```

## Deploy

1. Create a private GitHub repo, suggested template base: `https://github.com/wedgwooddigital/client-ops.git`.
2. Create a new Netlify site linked to that repo.
3. Leave **Base directory** empty in the Netlify UI — root [`netlify.toml`](../netlify.toml) sets `base = "dashboard"`.
4. **Publish directory:** `dist` (relative to `dashboard/`, not `dashboard/dist`).
5. Use build command `npm run build`.
6. Enable site-wide password protection in Netlify.
7. Use a Netlify subdomain unless another non-client-domain is approved.

Do not deploy this dashboard to the client's public website domain.

## Client-facing navigation

| Nav label | URL | Source folder |
|-----------|-----|---------------|
| Home | `/` | dashboard home |
| Documents | `/documents/` | `content/documents/` |
| Updates | `/updates/` | `content/updates/` |

Customise labels and intro copy in `dashboard/src/config/site.ts`.

## Add a document

Long-form dashboard content (audits, comparisons, roadmaps — often called "reports" in prose):

1. Add markdown to `content/documents/` with `clientVisible: true` when ready to publish.
2. See [`../content/documents/README.md`](../content/documents/README.md) for frontmatter conventions.
3. Rebuild and deploy the dashboard.
