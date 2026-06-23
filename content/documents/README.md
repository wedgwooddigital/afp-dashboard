# Dashboard documents — conventions

Long-form markdown for the client dashboard **Documents** section (`/documents/`).

"Report" is fine in document titles; this folder holds all dashboard documents, not only reports.

Set `clientVisible: true` explicitly to publish. Documents are hidden by default if the flag is omitted.

**Glossary:** [`../README.md`](../README.md)

```yaml
---
title: Document Title
description: Short summary for dashboard cards
date: 2026-06-01
category: ops
clientVisible: true
---
```

Allowed categories: `it`, `seo`, `marketing`, `social`, `creative`, `billing`, `ops`, `other`.

Do not include non-billable hours, non-billable amounts, secrets, credentials, or raw internal notes unless explicitly approved.
