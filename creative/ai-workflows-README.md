# AI Asset Generation

Guides for generating on-brand images, social graphics, and copy using AI tools — **no design software required**. Manual editing is optional polish, not the assumed workflow.

## Start here

1. Read [generation-workflow.md](./generation-workflow.md) — decision tree: what to generate vs composite
2. Read `company/brand/design.md` — colours, typography, do's and don'ts
3. Read `../company/product.md` — accurate product description
4. Read `../company/brand/voice.md` — tone for captions
5. Pick a guide below

## Guides

| File | Use for |
|---|---|
| [generation-workflow.md](./generation-workflow.md) | **Start here** — route by asset type; generate vs composite |
| [image-prompts.md](./image-prompts.md) | Midjourney, DALL·E, Gemini, Flux — product and lifestyle scenes |
| [social/templates.md](../social/templates.md) | Layout specs for text overlays when compositing is needed |

## Recommended workflow

### AI image or copy → publish

```
1. Route asset type          → creative/generation-workflow.md (decision tree)
2. Generate scene or copy    → image-prompts.md or company/brand/voice.md
3. Validate accuracy         → company/product.md + company/brand/design.md Do's and Don'ts
4. Composite logo/type       → Only if needed (see generation-workflow.md)
5. Write caption             → company/brand/voice.md
6. Optional human polish     → Fix AI mistakes; personal preference — not required
```

### Caption-only (no designed card)

Often the fastest on-brand path:

1. Real photo from `company/brand/assets/images/photography/` (preferred)
2. Caption from `company/brand/voice.md`
3. Validate against `company/brand/design.md` and `company/content-policy.md`

### Copy-only generation

Provide the agent with:

- `company/brand/voice.md` (tone)
- `company/audience.md` (who you're talking to)
- `company/product.md` (facts and specs)

### Website UI generation (future)

Provide:

- `company/brand/design.md` (full design system with YAML tokens)
- `company/overview.md` (brand context)

## Common mistakes to catch

- AI renders wrong thermometer shape (dial thermometer, Bluetooth probe)
- Hallucinated brand text on probe LCD screen
- Asking AI to render the wordmark instead of placing `company/brand/assets/logos/` SVG
- Wrong orange (`#FD9E27` site / `#F9A027` logo)
- Lifestyle and pack shot styles mixed in one frame
- Avoid in brand-written copy: revolutionary, game-changing (OK in customer quotes). Ultimate is allowed.
