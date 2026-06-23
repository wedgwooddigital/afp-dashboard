---
title: Social post workflow
description: Step-by-step from asset pick to publish — caption-only or composite
kind: playbooks
order: 10
clientVisible: true
updated: 2026-06-23
changelog: "v1 — from creative/generation-workflow.md"
tier: all
---

# Social post workflow

How to produce on-brand social content without design software. **Caption-only is the default** — designed cards are optional.

## Quick decision

| Goal | Path |
|------|------|
| Tip or product post with real photo | **Caption-only** (fastest) |
| New lifestyle / product scene | **AI image** → validate → optional logo composite |
| Branded card with type + logo | **AI background** → composite per `social/templates.md` |

---

## Path A — Caption-only (recommended)

1. **Pick a photo** from `company/brand/assets/images/photography/` or `social/assets-manifest.md`
2. **Choose a prompt** from Toolbox → Temperature tips or Social captions
3. **Validate copy** against `company/brand/voice.md`:
   - No *revolutionary* / *game-changing*
   - Chicken = **74°C** if mentioned
   - 3-in-1 bundle only (not mini screwdriver in headline)
   - No follower counts
4. **Publish** — no compositing step

---

## Path B — AI lifestyle / product image

1. Open Toolbox → **Product & lifestyle image prompts** (or `creative/image-prompts.md` for full library)
2. Paste **form factor block** + scene prompt into your image tool
3. Upload a **reference photo** from the manifest if supported
4. **Validate output:**
   - Probe shape matches `company/product.md`
   - UK home kitchen context (not restaurant)
   - No AI-rendered logos or text on LCD
5. **Composite logo** if needed — SVG from `company/brand/assets/logos/` (never retype "AIR FRYER")
6. **Write caption** using Social caption or Temperature tip prompts
7. Export at **1080 × 1080** (feed) or **1080 × 1920** (story)

---

## Path C — Designed temperature card

1. Generate **background only** (food scene or dark navy abstract) — no text in AI
2. Composite in any tool using `social/templates.md` Template 1:
   - Rubik 700–800 for protein name
   - Roboto Mono Bold for temp
   - Dark Navy `#11151C` background
   - Logo top-left from SVG
3. Caption from Temperature tip prompts
4. Export 1080 × 1080

---

## Validation checklist (every post)

- [ ] Temperatures match `company/temperature-guide.md` (chicken **74°C**)
- [ ] Bundle described as 3-in-1 (probe + guide + hook)
- [ ] Voice: confident, direct — no banned words
- [ ] Price £23.99 only if mentioning price
- [ ] Logo from SVG if visible on image
- [ ] No follower count claims

---

## Where to find more

| Need | Location |
|------|----------|
| Full image prompt library | `creative/image-prompts.md` |
| Layout dimensions & typography | `social/templates.md` |
| Voice & messaging | Toolbox → Voice |
| Brand facts for AI context | Toolbox → Brand facts sheet |
| Asset filenames | `social/assets-manifest.md` |
