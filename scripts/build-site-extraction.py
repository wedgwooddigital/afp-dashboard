#!/usr/bin/env python3
"""Process raw Firecrawl scrapes into cleaned site-content markdown files."""

from __future__ import annotations

import json
import re
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
RAW = ROOT / "reference/site-content/.raw"
OUT = ROOT / "reference/site-content"

FOOTER_MARKERS = [
    "## Quick Tips for Perfect Air Frying",
    "## Confirm your age",
    "This website uses cookies",
    "### Shopping Cart",
    "shop.app is blocked",
    "airfryerprobe.com is blocked",
    "**Unlock 10% Off**",
]

PAGE_META: dict[str, dict] = {
    "home": {
        "path": "pages/home.md",
        "title": "Homepage",
        "url": "https://airfryerprobe.com/",
        "type": "page",
    },
    "product": {
        "path": "pages/product.md",
        "title": "Product — Air Fryer Temperature Probe (3-in-1)",
        "url": "https://airfryerprobe.com/products/air-fryer-temperature-probe-hanging-hook-cooked-food-temperature-guide-3-in-1-package",
        "type": "product",
    },
    "about": {
        "path": "pages/about.md",
        "title": "About Us",
        "url": "https://airfryerprobe.com/pages/about-us",
        "type": "page",
    },
    "contact": {
        "path": "pages/contact.md",
        "title": "Contact",
        "url": "https://airfryerprobe.com/pages/contact",
        "type": "page",
    },
    "collections-all": {
        "path": "collections/all.md",
        "title": "Collection — All Products",
        "url": "https://airfryerprobe.com/collections/all",
        "type": "collection",
    },
    "collections-frontpage": {
        "path": "collections/frontpage.md",
        "title": "Collection — Frontpage",
        "url": "https://airfryerprobe.com/collections/frontpage",
        "type": "collection",
    },
    "collections-3in1": {
        "path": "collections/3-in-1-air-fryer-essentials-package.md",
        "title": "Collection — 3-in-1 Air Fryer Essentials Package",
        "url": "https://airfryerprobe.com/collections/3-in-1-air-fryer-essentials-package",
        "type": "collection",
    },
    "collections-kitchen": {
        "path": "collections/kitchen-and-dining-example-products.md",
        "title": "Collection — Kitchen and Dining Example Products",
        "url": "https://airfryerprobe.com/collections/kitchen-and-dining-example-products",
        "type": "collection",
    },
    "blog-index": {
        "path": "blog/index.md",
        "title": "Blog — News",
        "url": "https://airfryerprobe.com/blogs/news",
        "type": "blog-index",
    },
    "blog-benefits-thermometer": {
        "path": "blog/what-are-the-benefits-of-using-a-cooking-thermometer.md",
        "title": "What Are The Benefits Of Using A Cooking Thermometer",
        "url": "https://airfryerprobe.com/blogs/news/what-are-the-benefits-of-using-a-cooking-thermometer",
        "type": "blog-post",
        "author": "ben cribb",
        "published": "2026-01-03",
    },
    "blog-frying-pan": {
        "path": "blog/why-the-frying-pan-is-still-essential-to-air-frying.md",
        "title": "Why Pan Frying Is Still Essential To Air Frying",
        "url": "https://airfryerprobe.com/blogs/news/why-the-frying-pan-is-still-essential-to-air-frying",
        "type": "blog-post",
        "author": "ben cribb",
        "published": "2026-01-11",
    },
    "blog-accessories": {
        "path": "blog/5-must-have-air-fryer-accessories.md",
        "title": "5 Must-Have Air Fryer Accessories You Actually Need (and 2 You Don't)",
        "url": "https://airfryerprobe.com/blogs/news/5-must-have-air-fryer-accessories-you-actually-need-and-2-you-dont",
        "type": "blog-post",
        "author": "ben cribb",
        "published": "2026-02-01",
    },
    "blog-temperature-chart": {
        "path": "blog/ultimate-air-fryer-temperature-chart-2026.md",
        "title": "The Ultimate Air Fryer Temperature Chart for 2026",
        "url": "https://airfryerprobe.com/blogs/news/the-ultimate-air-fryer-temperature-chart-for-2026-beef-chicken-pork-fish",
        "type": "blog-post",
        "author": "ben cribb",
        "published": "2026-02-01",
    },
    "policy-privacy": {
        "path": "policies/privacy-policy.md",
        "title": "Privacy Policy",
        "url": "https://airfryerprobe.com/policies/privacy-policy",
        "type": "policy",
    },
    "policy-refund": {
        "path": "policies/refund-policy.md",
        "title": "Refund Policy",
        "url": "https://airfryerprobe.com/policies/refund-policy",
        "type": "policy",
    },
    "policy-terms": {
        "path": "policies/terms-of-service.md",
        "title": "Terms of Service",
        "url": "https://airfryerprobe.com/policies/terms-of-service",
        "type": "policy",
    },
}


def strip_footer(text: str) -> str:
    for marker in FOOTER_MARKERS:
        idx = text.find(marker)
        if idx != -1:
            text = text[:idx]
    return text


def dedupe_consecutive_lines(text: str) -> str:
    lines = text.splitlines()
    out: list[str] = []
    prev: str | None = None
    for line in lines:
        key = line.strip()
        if key and key == prev:
            continue
        out.append(line)
        prev = key if key else prev
    return "\n".join(out)


def dedupe_testimonial_blocks(text: str) -> str:
    """Remove duplicate ### testimonial heading + body pairs."""
    pattern = re.compile(
        r"(### [^\n]+\n\n(?:[^\n#][^\n]*\n?)+)",
        re.MULTILINE,
    )
    seen: set[str] = set()
    def repl(m: re.Match) -> str:
        block = m.group(1).strip()
        if block in seen:
            return ""
        seen.add(block)
        return m.group(1)
    return pattern.sub(repl, text)


def clean_markdown(text: str) -> str:
    text = strip_footer(text)
    text = dedupe_consecutive_lines(text)
    text = dedupe_testimonial_blocks(text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text.strip() + "\n"


def frontmatter(meta: dict) -> str:
    lines = ["---"]
    for k, v in meta.items():
        if k == "path":
            continue
        lines.append(f"{k}: {json.dumps(v) if isinstance(v, str) else v}")
    lines.append(f"extracted: {date.today().isoformat()}")
    lines.append("source: firecrawl")
    lines.append("---\n")
    return "\n".join(lines)


def enrich_product(content: str) -> str:
    json_path = RAW / "product.json"
    if not json_path.exists():
        return content
    p = json.loads(json_path.read_text())["product"]
    v = p["variants"][0]
    block = [
        "## Structured product data (Shopify API)",
        "",
        f"- **Title:** {p['title']}",
        f"- **Handle:** {p['handle']}",
        f"- **Vendor:** {p.get('vendor', '')}",
        f"- **Price (API):** £{v['price']}",
        f"- **Compare at:** £{v.get('compare_at_price') or '—'}",
        f"- **Product type:** {p.get('product_type') or '—'}",
        f"- **Tags:** {p.get('tags') or '—'}",
        "",
        "### API description (canonical product copy)",
        "",
    ]
    body = re.sub(r"<[^>]+>", "\n", p.get("body_html", ""))
    body = re.sub(r"\n{3,}", "\n\n", body).strip()
    block.append(body)
    block.append("")
    block.append("---")
    block.append("")
    block.append("## Page content (scraped)")
    block.append("")
    return "\n".join(block) + content


def process_file(name: str, meta: dict) -> None:
    raw_path = RAW / f"{name}.md"
    if not raw_path.exists():
        print(f"  skip missing: {name}")
        return
    content = clean_markdown(raw_path.read_text())
    if name == "product":
        content = enrich_product(content)
    out_path = OUT / meta["path"]
    out_path.parent.mkdir(parents=True, exist_ok=True)
    fm = {k: v for k, v in meta.items() if k != "path"}
    out_path.write_text(frontmatter(fm) + content)
    print(f"  ✓ {meta['path']}")


def main() -> None:
    print("Building site content extraction...")
    for name, meta in PAGE_META.items():
        process_file(name, meta)
    print("Done.")


if __name__ == "__main__":
    main()
