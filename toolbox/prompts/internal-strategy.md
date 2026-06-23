---
title: Internal strategy prompts
description: Agency-only prompts — not published to the client dashboard
kind: prompts
order: 99
clientVisible: false
updated: 2026-06-23
changelog: "v1 — internal example (hidden from dashboard)"
tier: managed
---

# Internal strategy prompts

This file demonstrates `clientVisible: false`. It syncs to `content/toolbox/` at build time but **does not** appear in dashboard routes or navigation.

Use this pattern for:

- Premium / managed-only prompts when the client dashboard tier is `diy`
- Draft prompts not ready for clients
- Agency workflow prompts

## Example internal prompt

```text
Review CLIENT_TRADING_NAME competitor positioning and suggest three content angles for the next quarter. Ops context only — do not share raw output with the client without editing.
```

See [`../README.md`](../README.md) for visibility and tier conventions.
