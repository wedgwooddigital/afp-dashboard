# How This Project Works

This repo is a **client operations workspace**. It holds ongoing work that should not live inside a website codebase — whether or not you built that website.

## Two modes

Check `company/facts.yaml` → `website.brand_source`:

| Mode | Website | Brand canonical location |
|------|---------|--------------------------|
| `sibling_repo` | Git repo beside ops (you built it) | Sibling website repo |
| `ops_local` | External platform or no repo yet | `company/brand/` in this ops repo |

Think of it as:

- **Website** = public site product (git repo you built, or external URL as reference)
- **Ops repo** = ongoing services, internal notes, billing, marketing, SEO, social, creative, IT
- **Client dashboard** = password-protected documents and updates for the client (separate from the public site)

When you later build a website for an `ops_local` client, see `company/MIGRATION-sibling-repo.md`.

## Core Workflow

1. Keep internal project work in the relevant domain folder.
2. Keep raw safe inputs in `reference/`.
3. Keep raw tool output in gitignored `research/`.
4. Keep sensitive access notes in gitignored `local/`.
5. Publish client-readable dashboard documents and updates through `content/` and the static dashboard in `dashboard/`.

**Glossary:** [`content/README.md`](content/README.md)

## Repo Map

```text
company/          Client facts, content policy, website pointers, brand/ (ops_local)
it/               IT inventory, projects, runbooks
seo/              GBP, reviews, on-page specs, off-page work
marketing/        Campaigns, analytics, email, local advertising
social/           Social strategy, drafts, assets, generated output
creative/         Photography, video, design, briefs, deliverables
billing/          Time summaries and invoice records
content/          Dashboard content glossary (content/README.md)
content/documents/  Long-form dashboard Documents
content/updates/  Short dashboard Updates
dashboard/        Astro client dashboard for Netlify
reference/        Raw materials safe to commit
research/         Gitignored research/tool cache
local/            Gitignored sensitive notes
scripts/          Helper scripts
```

## Publishing

The dashboard is static and password-protected at the Netlify site level. Use a Netlify subdomain unless a custom non-client-domain is deliberately approved.

Do not host the dashboard on the client's public website domain.

## Further reading

| Doc | Purpose |
|-----|---------|
| [AGENTS.md](./AGENTS.md) | AI routing and hard rules |
| [content/README.md](./content/README.md) | Client dashboard glossary |
| [company/content-policy.md](./company/content-policy.md) | What lives where |
| [company/MIGRATION-dashboard-naming.md](./company/MIGRATION-dashboard-naming.md) | Migrate older ops repos from reports/ naming |
