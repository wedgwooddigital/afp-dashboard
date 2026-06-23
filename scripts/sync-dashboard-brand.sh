#!/usr/bin/env bash
# Sync brand and toolbox sources into dashboard content collections + public assets.
# Usage: ./scripts/sync-dashboard-brand.sh
#
# Runs automatically before dashboard build (see dashboard/package.json prebuild).

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# shellcheck source=lib/brand-source.sh
source "${ROOT}/scripts/lib/brand-source.sh"
_brand_source_load "$ROOT"

WEBSITE_REPO_YAML="${ROOT}/company/website-repo.yaml"
CONTENT_BRAND="${ROOT}/content/brand"
CONTENT_TOOLBOX="${ROOT}/content/toolbox"
TOOLBOX_SRC="${ROOT}/toolbox"
BRAND_ASSETS_OUT="${ROOT}/dashboard/public/brand-assets"

# ---------------------------------------------------------------------------
# YAML helpers (minimal — matches brand-source.sh style)
# ---------------------------------------------------------------------------

_yaml_docs_value() {
  local key="$1"
  awk -v key="${key}:" '
    /^docs:/ { indocs=1; next }
    indocs && /^[^[:space:]]/ { indocs=0 }
    indocs && $1 == key {
      sub(/^[^:]+:[[:space:]]*/, "")
      gsub(/^["'\'']|["'\'']$/, "")
      sub(/[[:space:]]+#.*$/, "")
      print
      exit
    }
  ' "$WEBSITE_REPO_YAML" 2>/dev/null || true
}

_yaml_assets_value() {
  local key="$1"
  awk -v key="${key}:" '
    /^assets:/ { inassets=1; next }
    inassets && /^[^[:space:]]/ { inassets=0 }
    inassets && $1 == key {
      sub(/^[^:]+:[[:space:]]*/, "")
      gsub(/^["'\'']|["'\'']$/, "")
      sub(/[[:space:]]+#.*$/, "")
      print
      exit
    }
  ' "$WEBSITE_REPO_YAML" 2>/dev/null || true
}

# ---------------------------------------------------------------------------
# File utilities
# ---------------------------------------------------------------------------

_file_updated_iso() {
  local f="$1"
  if [[ "$(uname -s)" == "Darwin" ]]; then
    stat -f "%Sm" -t "%Y-%m-%d" "$f"
  else
    stat -c "%y" "$f" | cut -d' ' -f1
  fi
}

_has_frontmatter() {
  local f="$1"
  head -n 1 "$f" | grep -q '^---$'
}

# Write merged frontmatter + body to dest
# Args: dest title description order clientVisible sourcePath [extra frontmatter lines]
_sync_markdown() {
  local dest="$1"
  local title="$2"
  local description="$3"
  local order="$4"
  local client_visible="$5"
  local source_path="$6"
  local src="$7"

  mkdir -p "$(dirname "$dest")"

  local updated
  updated="$(_file_updated_iso "$src")"

  if _has_frontmatter "$src"; then
    # Preserve source frontmatter; inject collection fields when missing (e.g. design token YAML)
    awk -v sp="$source_path" -v upd="$updated" -v t="$title" -v d="$description" -v o="$order" -v cv="$client_visible" '
      BEGIN { in_fm=0; has_sp=0; has_upd=0; has_title=0; has_desc=0; has_order=0; has_cv=0 }
      NR==1 && /^---$/ { print; in_fm=1; next }
      in_fm && /^---$/ {
        if (!has_title) print "title: " t
        if (!has_desc) print "description: " d
        if (!has_order) print "order: " o
        if (!has_cv) print "clientVisible: " cv
        if (!has_sp) print "sourcePath: " sp
        if (!has_upd) print "updated: " upd
        print; in_fm=0; next
      }
      in_fm && /^title:/ { has_title=1 }
      in_fm && /^description:/ { has_desc=1 }
      in_fm && /^order:/ { has_order=1 }
      in_fm && /^clientVisible:/ { has_cv=1 }
      in_fm && /^sourcePath:/ { has_sp=1 }
      in_fm && /^updated:/ { has_upd=1 }
      { print }
    ' "$src" > "$dest"
  else
    cat > "$dest" <<EOF
---
title: ${title}
description: ${description}
order: ${order}
clientVisible: ${client_visible}
updated: ${updated}
sourcePath: ${source_path}
---

$(cat "$src")
EOF
  fi
}

_sync_toolbox_file() {
  local src="$1"
  local dest="$2"
  local rel_source="${src#"${ROOT}/"}"

  mkdir -p "$(dirname "$dest")"

  if _has_frontmatter "$src"; then
    awk -v sp="$rel_source" -v upd="$(_file_updated_iso "$src")" '
      BEGIN { in_fm=0; has_sp=0; has_upd=0 }
      NR==1 && /^---$/ { print; in_fm=1; next }
      in_fm && /^---$/ {
        if (!has_sp) print "sourcePath: " sp
        if (!has_upd) print "updated: " upd
        print; in_fm=0; next
      }
      in_fm && /^sourcePath:/ { has_sp=1 }
      in_fm && /^updated:/ { has_upd=1 }
      { print }
    ' "$src" > "$dest"
  else
    echo "sync-dashboard-brand: skipping ${rel_source} — toolbox sources require YAML frontmatter" >&2
    return 1
  fi
}

_resolve_brand_doc() {
  local yaml_key="$1"
  local ops_fallback="$2"

  local rel
  rel="$(_yaml_docs_value "$yaml_key")"
  if [[ -z "$rel" ]]; then
    rel="$ops_fallback"
  fi

  local candidate=""

  if [[ "$BRAND_SOURCE" == "ops_local" ]]; then
    if [[ -f "${ROOT}/${ops_fallback}" ]]; then
      candidate="${ROOT}/${ops_fallback}"
    elif [[ -f "${ROOT}/${rel}" ]]; then
      candidate="${ROOT}/${rel}"
    fi
  else
    if [[ -n "$WEBSITE_REPO" && -f "${WEBSITE_REPO}/${rel}" ]]; then
      candidate="${WEBSITE_REPO}/${rel}"
    elif [[ -f "${ROOT}/${ops_fallback}" ]]; then
      echo "sync-dashboard-brand: using ops fallback for ${yaml_key}: ${ops_fallback}" >&2
      candidate="${ROOT}/${ops_fallback}"
    fi
  fi

  if [[ -z "$candidate" || ! -f "$candidate" ]]; then
    echo "sync-dashboard-brand: missing source for ${yaml_key} (looked for ${rel}, fallback ${ops_fallback})" >&2
    return 1
  fi

  echo "$candidate"
}

_clean_generated() {
  local dir="$1"
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
    return
  fi
  find "$dir" -type f -name '*.md' ! -name 'README.md' -delete 2>/dev/null || true
}

_copy_assets_dir() {
  local src_dir="$1"
  local dest_sub="$2"
  if [[ ! -d "$src_dir" ]]; then
    return 0
  fi
  mkdir -p "${BRAND_ASSETS_OUT}/${dest_sub}"
  # Copy files only; ignore .gitkeep
  find "$src_dir" -type f ! -name '.gitkeep' -print0 2>/dev/null | while IFS= read -r -d '' f; do
    cp "$f" "${BRAND_ASSETS_OUT}/${dest_sub}/$(basename "$f")"
  done
}

_copy_logos_for_dashboard() {
  local src_dir="${OPS_BRAND_ASSETS}/logos"
  if [[ ! -d "$src_dir" ]]; then
    return 0
  fi
  mkdir -p "${BRAND_ASSETS_OUT}/logos"
  local f base ext
  for f in "$src_dir"/*; do
    [[ -e "$f" ]] || continue
    [[ -f "$f" ]] || continue
    base="$(basename "$f")"
    ext="${base##*.}"
    ext_lower="$(echo "$ext" | tr '[:upper:]' '[:lower:]')"
    case "$base" in
      Screenshot_*|Artboard\ 2.pdf) continue ;;
    esac
    if [[ "$ext_lower" == "svg" || "$base" == "air-fryer-label.png" ]]; then
      cp "$f" "${BRAND_ASSETS_OUT}/logos/${base}"
    fi
  done
}

_yaml_dashboard_images() {
  awk '
    /^dashboard_assets:/ { in_da=1; next }
    in_da && /^[^[:space:]-]/ { in_da=0 }
    in_da && /^  images:/ { in_img=1; next }
    in_img && /^  [a-zA-Z_]/ && !/^  images:/ { in_img=0 }
    in_img && /^    - / {
      sub(/^    - /, "")
      gsub(/^["'\'']|["'\'']$/, "")
      sub(/[[:space:]]+#.*$/, "")
      print
    }
  ' "$WEBSITE_REPO_YAML" 2>/dev/null || true
}

_copy_curated_dashboard_images() {
  local rel src copied=0
  mkdir -p "${BRAND_ASSETS_OUT}/images"
  while IFS= read -r rel; do
    [[ -z "$rel" ]] && continue
    src="${ROOT}/${rel}"
    if [[ ! -f "$src" ]]; then
      echo "sync-dashboard-brand: dashboard image not found: ${rel}" >&2
      continue
    fi
    cp "$src" "${BRAND_ASSETS_OUT}/images/$(basename "$src")"
    copied=$((copied + 1))
  done < <(_yaml_dashboard_images)
  if [[ "$copied" -eq 0 ]]; then
    echo "sync-dashboard-brand: no dashboard_assets.images listed; copying full images tree" >&2
    _copy_assets_dir "${OPS_BRAND_ASSETS}/images" "images"
  else
    echo "sync-dashboard-brand: copied ${copied} curated image(s) for dashboard"
  fi
}

# ---------------------------------------------------------------------------
# Brand doc sync definitions: yaml_key | ops_fallback | dest_slug | title | description | order | clientVisible
# ---------------------------------------------------------------------------

sync_brand_doc() {
  local yaml_key="$1"
  local ops_fallback="$2"
  local dest_slug="$3"
  local title="$4"
  local description="$5"
  local order="$6"
  local client_visible="${7:-false}"

  local src
  src="$(_resolve_brand_doc "$yaml_key" "$ops_fallback")" || return 0

  local rel_source="${src#"${ROOT}/"}"
  if [[ -n "${WEBSITE_REPO:-}" && "$src" == "${WEBSITE_REPO}"/* ]]; then
    rel_source="${src#"${WEBSITE_REPO}/"} (website repo)"
  fi

  _sync_markdown \
    "${CONTENT_BRAND}/${dest_slug}.md" \
    "$title" \
    "$description" \
    "$order" \
    "$client_visible" \
    "$rel_source" \
    "$src"

  echo "sync-dashboard-brand: brand → content/brand/${dest_slug}.md"
}

sync_voice_to_toolbox() {
  local src
  src="$(_resolve_brand_doc "brand_voice" "company/brand/voice.md")" || return 0

  local dest="${CONTENT_TOOLBOX}/voice.md"
  local rel_source="${src#"${ROOT}/"}"
  if [[ -n "${WEBSITE_REPO:-}" && "$src" == "${WEBSITE_REPO}"/* ]]; then
    rel_source="${src#"${WEBSITE_REPO}/"} (website repo)"
  fi

  # clientVisible defaults to false (approval-gated) when company/brand/voice.md
  # has no frontmatter. Add `clientVisible: true` to the source to publish.
  _sync_markdown \
    "$dest" \
    "Voice & tone" \
    "How we write and speak — for staff and AI tools" \
    10 \
    false \
    "$rel_source" \
    "$src"

  # Toolbox pages need kind: reference in frontmatter — inject after sync if missing
  if ! grep -q '^kind:' "$dest"; then
    awk '
      /^---$/ && !done { print; print "kind: reference"; done=1; next }
      { print }
    ' "$dest" > "${dest}.tmp" && mv "${dest}.tmp" "$dest"
  fi

  echo "sync-dashboard-brand: toolbox → content/toolbox/voice.md"
}

sync_toolbox_tree() {
  local subdir="$1" # prompts | playbooks | templates
  local src_dir="${TOOLBOX_SRC}/${subdir}"
  if [[ ! -d "$src_dir" ]]; then
    return 0
  fi
  local f
  for f in "$src_dir"/*.md; do
    [[ -e "$f" ]] || continue
    [[ "$(basename "$f")" == "README.md" ]] && continue
    local base
    base="$(basename "$f" .md)"
    _sync_toolbox_file "$f" "${CONTENT_TOOLBOX}/${subdir}/${base}.md"
    echo "sync-dashboard-brand: toolbox → content/toolbox/${subdir}/${base}.md"
  done
}

sync_assets() {
  rm -rf "$BRAND_ASSETS_OUT"
  mkdir -p "$BRAND_ASSETS_OUT"

  local logos_rel images_rel
  logos_rel="$(_yaml_assets_value "logos")"
  images_rel="$(_yaml_assets_value "images")"

  if [[ "$BRAND_SOURCE" == "ops_local" ]]; then
    _copy_logos_for_dashboard
    _copy_curated_dashboard_images
  else
    local logos_src images_src
    logos_src="${WEBSITE_REPO}/${logos_rel:-public/assets/logos}"
    images_src="${WEBSITE_REPO}/${images_rel:-public/assets/images}"
    if [[ -d "$logos_src" ]]; then
      _copy_assets_dir "$logos_src" "logos"
    else
      echo "sync-dashboard-brand: no sibling logos at ${logos_src}; using ops fallback" >&2
      _copy_assets_dir "${OPS_BRAND_ASSETS}/logos" "logos"
    fi
    if [[ -d "$images_src" ]]; then
      _copy_assets_dir "$images_src" "images"
    else
      _copy_assets_dir "${OPS_BRAND_ASSETS}/images" "images"
    fi
  fi

  local count
  count="$(find "$BRAND_ASSETS_OUT" -type f 2>/dev/null | wc -l | tr -d ' ')"
  echo "sync-dashboard-brand: copied ${count} asset file(s) → dashboard/public/brand-assets/"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

main() {
  if [[ ! -f "$WEBSITE_REPO_YAML" ]]; then
    echo "sync-dashboard-brand: missing ${WEBSITE_REPO_YAML}" >&2
    exit 1
  fi

  echo "sync-dashboard-brand: brand_source=${BRAND_SOURCE}"

  _clean_generated "$CONTENT_BRAND"
  _clean_generated "$CONTENT_TOOLBOX"
  find "${CONTENT_TOOLBOX}" -mindepth 1 -type d -empty -delete 2>/dev/null || true

  # clientVisible defaults to false (approval-gated) for sources WITHOUT frontmatter.
  # To publish a brand page, add `clientVisible: true` to its frontmatter in the
  # ops source (company/brand/*.md or the sibling website docs). This keeps the
  # publish boundary consistent with documents/updates: nothing ships until approved.
  sync_brand_doc "brand_guidelines" "company/brand/branding.md" "guidelines" \
    "Colours & logos" "Brand palette, typography, and logo usage" 10 false

  sync_brand_doc "design_system" "company/brand/design.md" "design-system" \
    "Design system" "UI patterns, spacing, and layout rules" 20 false

  sync_brand_doc "video_frame" "company/brand/frame.md" "video-and-motion" \
    "Video & motion" "Aspect ratios, captions, and motion guidelines" 30 false

  sync_voice_to_toolbox

  if [[ -f "${TOOLBOX_SRC}/facts.md" ]]; then
    _sync_toolbox_file "${TOOLBOX_SRC}/facts.md" "${CONTENT_TOOLBOX}/facts.md"
    echo "sync-dashboard-brand: toolbox → content/toolbox/facts.md"
  fi

  sync_toolbox_tree "prompts"
  sync_toolbox_tree "playbooks"
  sync_toolbox_tree "templates"

  sync_assets

  echo "sync-dashboard-brand: done"
}

main "$@"
