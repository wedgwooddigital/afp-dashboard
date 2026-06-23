# Display Font Research — Replacing Angelic Child

**Date:** June 2026  
**Decision:** ✅ **Rubik** — **Bold (700)** for H2–H4; **Extra Bold (800)** for hero H1 and primary social headlines. [Google Fonts](https://fonts.google.com/specimen/Rubik), SIL OFL, free commercial use.  
**Unchanged:** Roboto Mono (body, temps, UI) · Anton Modified (logo SVG only)  
**Applied in:** `company/brand/design.md`, `AGENTS.md`, `social/templates.md`

---

## Original brief

**Goal:** Find a **Google Fonts** (OFL / free commercial use) replacement for Angelic Child as the display/heading typeface.

---

## What Angelic Child does in this brand

From `company/brand/design.md`:

| Role | Usage |
|------|--------|
| Display / H1–H4 | Section headings, social headlines, protein names on temperature graphics |
| Character | **Rounded, blocky** display sans |
| Pairing | Roboto Mono for body and temperature values |
| Rules | Display only — never body copy; max two type sizes per social frame |

Angelic Child is a Darrell Flood design (DaFont / Creative Fabrica, ~$20 commercial). Rounded terminals, medium-heavy weight, informal but chunky letterforms — closer to **rounded geometric display** than to a refined neo-grotesque.

---

## Evaluation criteria

| Criterion | Weight | Notes |
|-----------|--------|-------|
| Visual match (rounded + blocky) | High | Should feel at home on dark navy + orange social templates |
| Brand fit | High | Confident kitchen-tech, not childish, not chef-exclusive |
| Pairs with Roboto Mono | High | Contrast display vs mono precision |
| Google Fonts / OFL commercial | Required | No paid license |
| Weight range | Medium | Need bold for 60–96px social headlines |
| All-caps readability | Medium | `CHICKEN BREAST`, `3-IN-1 BUNDLE` |
| Web + Figma + AI tooling | Medium | Easy `@import` and agent instructions |

---

## Recommended shortlist

### 1. Fredoka — **best overall replacement**

| | |
|---|---|
| **Google Fonts** | [fonts.google.com/specimen/Fredoka](https://fonts.google.com/specimen/Fredoka) |
| **License** | SIL Open Font License |
| **Weights** | Variable 300–700 |
| **Style** | Rounded geometric sans; soft corners, chunky proportions |

**Pros:** Closest feel to Angelic Child’s rounded blockiness; variable font; works at display sizes; widely used in product UI without feeling infantile at **600–700**.  
**Cons:** Tagged “playful / childlike” on Google Fonts — use **Semibold/Bold only**, avoid light weights for brand work.  
**Use in kit:** `CHICKEN BREAST` headline, hero H1, Template 1–5 headlines.

```css
@import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@500;600;700&family=Roboto+Mono:wght@400;700&display=swap');
```

---

### 2. Rubik — **best “precision instrument” tilt**

| | |
|---|---|
| **Google Fonts** | [fonts.google.com/specimen/Rubik](https://fonts.google.com/specimen/Rubik) |
| **License** | SIL Open Font License |
| **Weights** | 300–900 (incl. Black) |
| **Style** | Geometric sans with **slightly rounded corners** — less blobby than Fredoka |

**Pros:** More technical/modern; excellent contrast with Roboto Mono (both geometric families); full weight range; strong at 42–60px section headings.  
**Cons:** Less “chunky block” than Angelic Child — corners are subtle, not fully rounded.  
**Use in kit:** Product feature callouts, website H2–H3, slightly more serious than Fredoka.

```css
@import url('https://fonts.googleapis.com/css2?family=Rubik:wght@600;700;800&family=Roboto+Mono:wght@400;700&display=swap');
```

---

### 3. Paytone One — **best single-weight poster headline**

| | |
|---|---|
| **Google Fonts** | [fonts.google.com/specimen/Paytone+One](https://fonts.google.com/specimen/Paytone+One) |
| **License** | SIL Open Font License |
| **Weights** | 400 only (single weight) |
| **Style** | Advertising display sans (Vernon Adams); loud, confident, slightly rounded |

**Pros:** Strong social-poster impact; echoes the “advertising sans” lineage of Anton (logo) without conflicting; good for short uppercase headlines.  
**Cons:** **One weight only** — no fine-tuning; can feel heavy in long headings; less rounded than Angelic Child.  
**Use in kit:** Temperature tip numerals’ *protein label* only, or short CTAs (`SHOP NOW`).

---

## Strong alternatives (context-dependent)

| Font | Best for | Trade-off |
|------|----------|-----------|
| [Bowlby One SC](https://fonts.google.com/specimen/Bowlby+One+SC) | All-caps social labels (`CHICKEN`, `74°C` companion line) | **Small caps / all caps only** — not for sentence headlines |
| [Concert One](https://fonts.google.com/specimen/Concert+One) | Softer, friendly hero lines | Single weight; more vintage/grotesque than blocky |
| [Kanit](https://fonts.google.com/specimen/Kanit) (600–700) | Industrial-rounded; multi-weight | Thai/Latin family; slightly more “gadget” than kitchen |
| [Nunito](https://fonts.google.com/specimen/Nunito) (700–800) | Readable rounded headlines | Softer, less blocky — risks looking generic wellness |
| [Righteous](https://fonts.google.com/specimen/Righteous) | Retro deco impact | Art deco, not rounded block — different personality |

---

## Not recommended for this brand

| Font | Why avoid |
|------|-----------|
| Bagel Fat One, Chewy, Luckiest Guy, Sniglet | Too cute / food-cartoon — undermines “precision instrument” |
| Comfortaa, Varela Round | Too soft and light for dark navy + orange contrast |
| Bebas Neue, Anton (retyped) | Not rounded; Anton is logo-only per brand rules |
| Space Grotesk | Pairs with Space Mono, not Roboto Mono; sharper tech look |
| Quicksand | Elegant rounded — closer to lifestyle than blocky display |

---

## Side-by-side for social Template 1

| Font | `CHICKEN BREAST` at 72px | Brand fit |
|------|--------------------------|-----------|
| Angelic Child (current) | Rounded blocks, informal | Baseline — paid license |
| **Fredoka 600–700** | Very close chunkiness | High |
| **Rubik 700–800** | Cleaner, slightly sharper | High (more technical) |
| **Paytone One** | Bold poster, all-caps strong | Medium–high (short text only) |
| Bowlby One SC | Maximum block, caps only | Medium (labels only) |

**Roboto Mono Bold** stays for `74°C` and caption lines in all options.

---

## Recommendation

| Priority | Choice | Rationale |
|----------|--------|-----------|
| **First pick** | **Fredoka** (600–700) | Nearest rounded blocky substitute; variable; free; easy Google Fonts embed |
| **If Fredoka feels too playful** | **Rubik** (700–800) | More technical; still rounded; better “probe as instrument” positioning |
| **Hybrid approach** | Fredoka headlines + Bowlby One SC for all-caps protein labels | Optional — only if you want extra punch on temp posts |

**Decision applied (Jun 2026):** Rubik — see top of this file. `company/brand/design.md`, `AGENTS.md`, `social/templates.md`, `README.md`, and `goals.md` updated.

---

## References

- [Angelic Child on DaFont](https://www.dafont.com/angelic-child.font) — donationware / $20 commercial (Darrell Flood)
- [Google Fonts FAQ — licensing](https://developers.google.com/fonts/faq) — OFL fonts free for commercial use
- Brand typography rules: `company/brand/design.md` § Typography
