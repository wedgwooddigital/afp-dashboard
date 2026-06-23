#!/usr/bin/env bash
# Discover all CDN image filenames referenced across the live site.
# Writes company/brand/assets/cdn-inventory.txt (one filename per line).
#
# Usage: ./scripts/discover-assets.sh
# Requires: firecrawl CLI, rg

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ASSETS="$ROOT/company/brand/assets"
OUT="$ASSETS/cdn-inventory.txt"
SCRATCH="$ROOT/research/firecrawl-discover"
mkdir -p "$SCRATCH"

URLS=(
  "https://airfryerprobe.com"
  "https://airfryerprobe.com/products/air-fryer-temperature-probe-hanging-hook-cooked-food-temperature-guide-3-in-1-package"
  "https://airfryerprobe.com/pages/about-us"
  "https://airfryerprobe.com/pages/contact"
  "https://airfryerprobe.com/collections/all"
  "https://airfryerprobe.com/collections/frontpage"
  "https://airfryerprobe.com/collections/3-in-1-air-fryer-essentials-package"
  "https://airfryerprobe.com/collections/kitchen-and-dining-example-products"
  "https://airfryerprobe.com/blogs/news"
  "https://airfryerprobe.com/blogs/news/what-are-the-benefits-of-using-a-cooking-thermometer"
  "https://airfryerprobe.com/blogs/news/why-the-frying-pan-is-still-essential-to-air-frying"
  "https://airfryerprobe.com/blogs/news/5-must-have-air-fryer-accessories-you-actually-need-and-2-you-dont"
  "https://airfryerprobe.com/blogs/news/the-ultimate-air-fryer-temperature-chart-for-2026-beef-chicken-pork-fish"
)

echo "Scraping ${#URLS[@]} pages..."
for url in "${URLS[@]}"; do
  slug=$(echo "$url" | sed 's|https://airfryerprobe.com/||;s|/|_|g;s|_$||')
  [ -z "$slug" ] && slug="home"
  firecrawl scrape "$url" -o "$SCRATCH/${slug}.md" 2>/dev/null || echo "  warn: failed $url"
done

rg -o 'cdn/shop/files/[^)\s"?&]+' "$SCRATCH" "$ROOT/reference" --no-filename 2>/dev/null \
  | sed 's|cdn/shop/files/||' \
  | sort -u > "$OUT"

echo "Found $(wc -l < "$OUT" | tr -d ' ') unique CDN files → $OUT"

LOCAL=$(mktemp)
find "$ASSETS" -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.webp' \) -exec basename {} \; | sort -u > "$LOCAL"
MISSING=$(comm -23 "$OUT" "$LOCAL" || true)
if [ -n "$MISSING" ]; then
  echo "Missing locally:"
  echo "$MISSING"
else
  echo "All discovered CDN files are present locally."
fi
rm -f "$LOCAL"
