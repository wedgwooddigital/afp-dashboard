#!/usr/bin/env bash
# Resolve a brand asset path (logos/, images/, or full path under assets root).
# Usage: ./scripts/resolve-website-asset.sh logos/example-logo.png
#
# sibling_repo — resolves under sibling website public/assets/
# ops_local    — resolves under company/brand/assets/

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# shellcheck source=lib/brand-source.sh
source "${ROOT}/scripts/lib/brand-source.sh"
_brand_source_load "$ROOT"

REL="${1:?Usage: resolve-website-asset.sh <path-under-assets>}"

if [[ "$BRAND_SOURCE" == "ops_local" ]]; then
  case "$REL" in
    company/brand/assets/*) TARGET="${OPS_ROOT}/${REL}" ;;
    public/assets/*) TARGET="${OPS_BRAND_ASSETS}/${REL#public/assets/}" ;;
    logos/*|images/*) TARGET="${OPS_BRAND_ASSETS}/${REL}" ;;
    *) TARGET="${OPS_BRAND_ASSETS}/${REL}" ;;
  esac
  ROOT_LABEL="ops brand assets (${OPS_BRAND_ASSETS})"
else
  WEBSITE="${WEBSITE_REPO:-${ROOT}/../client_website}"
  case "$REL" in
    public/assets/*) TARGET="${WEBSITE}/${REL}" ;;
    logos/*|images/*) TARGET="${WEBSITE}/public/assets/${REL}" ;;
    *) TARGET="${WEBSITE}/public/assets/${REL}" ;;
  esac
  ROOT_LABEL="website repo (${WEBSITE})"
fi

if [[ ! -e "$TARGET" ]]; then
  echo "Not found: $TARGET" >&2
  echo "Brand source: ${BRAND_SOURCE}" >&2
  echo "Root: ${ROOT_LABEL}" >&2
  exit 1
fi

echo "$TARGET"
