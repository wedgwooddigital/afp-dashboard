#!/usr/bin/env bash
# Read website.brand_source and repo path from company/facts.yaml.
# Source from other scripts: source "$(dirname "$0")/lib/brand-source.sh"

set -euo pipefail

_brand_source_load() {
  local root="${1:?ops root required}"
  local facts="${root}/company/facts.yaml"

  if [[ ! -f "$facts" ]]; then
    echo "brand-source.sh: missing ${facts}" >&2
    exit 1
  fi

  OPS_ROOT="$root"
  BRAND_SOURCE="$(awk '
    /^website:/ { in_website=1; next }
    in_website && /^[^[:space:]]/ { in_website=0 }
    in_website && /brand_source:/ {
      gsub(/.*brand_source:[[:space:]]*/, "")
      gsub(/[[:space:]]*#.*/, "")
      gsub(/"/, "")
      print
      exit
    }
  ' "$facts")"

  if [[ -z "$BRAND_SOURCE" ]]; then
    BRAND_SOURCE="sibling_repo"
  fi

  local rel_path abs_path
  rel_path="$(awk '
    /^website:/ { in_website=1; next }
    in_website && /^[^[:space:]]/ { in_website=0 }
    in_website && /relative_path:/ {
      gsub(/.*relative_path:[[:space:]]*/, "")
      gsub(/[[:space:]]*#.*/, "")
      gsub(/"/, "")
      if ($0 == "null") print ""
      else print
      exit
    }
  ' "$facts")"

  abs_path="$(awk '
    /^website:/ { in_website=1; next }
    in_website && /^[^[:space:]]/ { in_website=0 }
    in_website && /absolute_path:/ {
      gsub(/.*absolute_path:[[:space:]]*/, "")
      gsub(/[[:space:]]*#.*/, "")
      gsub(/"/, "")
      if ($0 == "null") print ""
      else print
      exit
    }
  ' "$facts")"

  WEBSITE_REPO=""
  if [[ "$BRAND_SOURCE" == "sibling_repo" ]]; then
    if [[ -n "${WEBSITE_REPO_OVERRIDE:-}" ]]; then
      WEBSITE_REPO="$WEBSITE_REPO_OVERRIDE"
    elif [[ -n "$abs_path" && "$abs_path" != "null" ]]; then
      WEBSITE_REPO="$abs_path"
    elif [[ -n "$rel_path" && "$rel_path" != "null" ]]; then
      WEBSITE_REPO="$( (cd "${OPS_ROOT}" && cd "${rel_path}" && pwd) 2>/dev/null || true )"
      if [[ -z "$WEBSITE_REPO" ]]; then
        WEBSITE_REPO="${OPS_ROOT}/${rel_path}"
      fi
    else
      WEBSITE_REPO="$( (cd "${OPS_ROOT}/../client_website" && pwd) 2>/dev/null || true )"
      if [[ -z "$WEBSITE_REPO" ]]; then
        WEBSITE_REPO="${OPS_ROOT}/../client_website"
      fi
    fi
  fi

  OPS_BRAND_ASSETS="${OPS_ROOT}/company/brand/assets"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
  _brand_source_load "$ROOT"
  echo "brand_source=${BRAND_SOURCE}"
  echo "ops_root=${OPS_ROOT}"
  echo "website_repo=${WEBSITE_REPO:-}"
  echo "ops_brand_assets=${OPS_BRAND_ASSETS:-}"
fi
