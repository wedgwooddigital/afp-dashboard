#!/usr/bin/env bash
# Discover and download brand photography from airfryerprobe.com CDN.
#
# Usage:
#   ./scripts/download-assets.sh          # discover + download missing
#   ./scripts/download-assets.sh --skip-discover  # download from existing inventory only

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BASE="https://airfryerprobe.com/cdn/shop/files"
ASSETS="$ROOT/company/brand/assets"
INVENTORY="$ASSETS/cdn-inventory.txt"

if [[ "${1:-}" != "--skip-discover" ]]; then
  "$ROOT/scripts/discover-assets.sh"
fi

if [[ ! -f "$INVENTORY" ]]; then
  echo "No inventory at $INVENTORY — run discover first." >&2
  exit 1
fi

categorize() {
  local file="$1"
  case "$file" in
    icons8-*)                    echo "images/icons" ;;
    Screenshot_2025-12-03*)      echo "logos" ;;
    Screenshot_*)                echo "images/graphics" ;;
    Gemini_Generated_*|gemini_*) echo "images/photography/ai-generated" ;;
    Untitled_design_*|air_fryer_*|reviews.jpg) echo "images/graphics" ;;
    probe_*|probewithsteak*|IMG_*|AFB_*|AFP_*|AirFryerLabel*|*-*-*-*-*.jpg|*_*-*.jpg)
      if [[ "$file" == probe_close_up* || "$file" == probefront* || "$file" == AFB_* || "$file" == AFP_* || "$file" == IMG_* || "$file" == AirFryerLabel* || "$file" == probe_with_box* ]]; then
        echo "images/photography/product"
      else
        echo "images/photography/lifestyle"
      fi
      ;;
    *) echo "images/photography/lifestyle" ;;
  esac
}

download() {
  local file="$1"
  local dir
  dir=$(categorize "$file")
  local out="$ASSETS/$dir/$file"
  if [[ -f "$out" ]]; then
    echo "  skip (exists) $file"
    return 0
  fi
  mkdir -p "$(dirname "$out")"
  echo "  → $file → company/brand/assets/$dir/"
  curl -fsSL "$BASE/$file" -o "$out"
}

echo "Downloading $(wc -l < "$INVENTORY" | tr -d ' ') files from CDN..."
while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  download "$file"
done < "$INVENTORY"

echo "Done. $(find "$ASSETS/images" -type f \( -name '*.jpg' -o -name '*.png' \) 2>/dev/null | wc -l | tr -d ' ') images under company/brand/assets/images/"
echo "See social/assets-manifest.md for inventory."
