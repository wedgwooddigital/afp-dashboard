#!/usr/bin/env bash
# Migrate an existing ops repo from reports/ + content/reports/ to dashboard/ + content/documents/.
#
# Usage (from target ops repo):
#   ../client_ops_template/scripts/migrate-dashboard-naming.sh
#
# Or:
#   ./scripts/migrate-dashboard-naming.sh /path/to/client_ops

set -euo pipefail

TEMPLATE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$(pwd)}"
TARGET="$(cd "$TARGET" && pwd)"

if [[ ! -f "${TARGET}/AGENTS.md" ]]; then
  echo "Error: ${TARGET} does not look like an ops repo (no AGENTS.md)" >&2
  exit 1
fi

if [[ -d "${TARGET}/reports" && -d "${TARGET}/dashboard" ]]; then
  echo "Error: both reports/ and dashboard/ exist in ${TARGET}" >&2
  exit 1
fi

cd "$TARGET"
echo "Migrating dashboard naming in ${TARGET}..."

git_mv_if_exists() {
  local src="$1" dest="$2"
  if [[ -d "$src" && ! -e "$dest" ]]; then
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      git mv "$src" "$dest"
    else
      mv "$src" "$dest"
    fi
    echo "  moved ${src} → ${dest}"
  fi
}

git_mv_if_exists reports dashboard
git_mv_if_exists content/reports content/documents

if [[ ! -d dashboard ]]; then
  echo "Error: dashboard/ not found after rename" >&2
  exit 1
fi

if [[ ! -d content/documents ]]; then
  echo "Error: content/documents/ not found after rename" >&2
  exit 1
fi

echo "Syncing dashboard app source from template (keeping site.ts)..."
SITE_TS_BACKUP=""
if [[ -f dashboard/src/config/site.ts ]]; then
  SITE_TS_BACKUP="$(mktemp)"
  cp dashboard/src/config/site.ts "$SITE_TS_BACKUP"
fi

copy_template() {
  local rel="$1"
  local src="${TEMPLATE_ROOT}/${rel}"
  local dest="${TARGET}/${rel}"
  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "  copied ${rel}"
  fi
}

for rel in \
  dashboard/src/content.config.ts \
  dashboard/src/layouts/DashboardLayout.astro \
  dashboard/src/styles/dashboard.css \
  dashboard/src/pages/index.astro \
  dashboard/src/pages/documents/index.astro \
  dashboard/src/pages/document/\[id\].astro \
  dashboard/src/pages/updates/index.astro \
  dashboard/src/pages/updates/\[id\].astro \
  dashboard/netlify.toml \
  content/README.md \
  content/documents/README.md \
  content/updates/README.md; do
  copy_template "$rel"
done

if [[ -n "$SITE_TS_BACKUP" ]]; then
  cp "$SITE_TS_BACKUP" dashboard/src/config/site.ts
  rm -f "$SITE_TS_BACKUP"
fi

# Remove legacy stylesheet if rename left it behind
rm -f dashboard/src/styles/reports.css

echo "Updating config files..."
python3 << 'PY'
import re
from pathlib import Path

root = Path(".")

def patch_file(path: Path):
    text = path.read_text()
    original = text
    text = text.replace("content/reports", "content/documents")
    text = re.sub(r"(?<!content/)reports/", "dashboard/", text)
    text = text.replace("cd dashboard &&", "cd dashboard &&")
    text = text.replace('base = "reports"', 'base = "dashboard"')
    if path.name == ".gitignore":
        text = text.replace("reports/dist/", "dashboard/dist/")
        text = text.replace("reports/node_modules/", "dashboard/node_modules/")
        text = text.replace("reports/.astro/", "dashboard/.astro/")
    if path.name == "facts.yaml" and "dashboard_config:" not in text:
        text = text.replace(
            "dashboard_netlify:",
            "dashboard_config: dashboard/src/config/site.ts\n  dashboard_netlify:",
        )
    if text != original:
        path.write_text(text)

exts = {".md", ".mdc", ".yaml", ".toml", ".sh", ".json"}
skip = {"node_modules", "dist", ".astro", ".git"}
for path in root.rglob("*"):
    if not path.is_file() or path.suffix not in exts:
        continue
    if any(p in skip for p in path.parts):
        continue
    if path.is_relative_to(Path("dashboard/node_modules")):
        continue
    patch_file(path)

# package.json name hint
pkg = Path("dashboard/package.json")
if pkg.exists():
    t = pkg.read_text()
    if "ops-reports" in t:
        pkg.write_text(t.replace("ops-reports", "ops-dashboard"))
PY

if grep -q '"name": "jpf-ops-reports"' dashboard/package.json 2>/dev/null; then
  :
fi

echo "Building dashboard..."
(cd dashboard && npm run build)

echo ""
echo "Done. Review git diff, then:"
echo "  - Confirm company/facts.yaml has urls.dashboard_config"
echo "  - Update Netlify base directory to dashboard if needed"
echo "  - See company/MIGRATION-dashboard-naming.md for full checklist"
