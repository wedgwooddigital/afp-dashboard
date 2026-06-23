#!/usr/bin/env bash
# Bootstrap a new client ops repo from this template.
#
# Usage:
#   ./scripts/bootstrap-ops.sh --name rosenkelly --mode external \
#     --url https://example.com --platform squarespace \
#     [--dest ~/Projects/client-sites/rosenkelly_ops]
#
#   ./scripts/bootstrap-ops.sh --name acme --mode sibling \
#     --website-repo acme_website --url https://acme.com \
#     [--dest ~/Projects/client-sites/acme_ops]

set -euo pipefail

TEMPLATE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NAME=""
MODE="sibling"
URL=""
PLATFORM=""
WEBSITE_REPO=""
DEST=""

usage() {
  sed -n '2,14p' "$0" | sed 's/^# \?//'
  exit "${1:-0}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --name) NAME="$2"; shift 2 ;;
    --mode) MODE="$2"; shift 2 ;;
    --url) URL="$2"; shift 2 ;;
    --platform) PLATFORM="$2"; shift 2 ;;
    --website-repo) WEBSITE_REPO="$2"; shift 2 ;;
    --dest) DEST="$2"; shift 2 ;;
    -h|--help) usage 0 ;;
    *) echo "Unknown option: $1" >&2; usage 1 ;;
  esac
done

if [[ -z "$NAME" ]]; then
  echo "Error: --name is required" >&2
  usage 1
fi

if [[ -z "$DEST" ]]; then
  DEST="${HOME}/Projects/client-sites/${NAME}_ops"
fi

if [[ -e "$DEST" && "$(ls -A "$DEST" 2>/dev/null)" ]]; then
  echo "Error: destination exists and is not empty: $DEST" >&2
  exit 1
fi

if [[ "$MODE" != "sibling" && "$MODE" != "external" ]]; then
  echo "Error: --mode must be sibling or external" >&2
  exit 1
fi

if [[ "$MODE" == "external" && -z "$URL" ]]; then
  echo "Error: --url is required for external mode" >&2
  exit 1
fi

if [[ "$MODE" == "sibling" && -z "$WEBSITE_REPO" ]]; then
  WEBSITE_REPO="${NAME}_website"
fi

# Human-readable defaults from slug
SLUG="${NAME//_/-}"
TRADING_NAME="$(echo "$NAME" | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}')"
OPS_REPO_NAME="${SLUG}-ops"
NETLIFY_URL="https://${SLUG}-ops.netlify.app"
GITHUB_REMOTE="https://github.com/wedgwooddigital/${OPS_REPO_NAME}.git"

mkdir -p "$(dirname "$DEST")"
echo "Copying template to ${DEST}..."
rsync -a \
  --exclude '.git' \
  --exclude 'dashboard/node_modules' \
  --exclude 'dashboard/dist' \
  --exclude 'dashboard/.astro' \
  "${TEMPLATE_ROOT}/" "${DEST}/"

cd "$DEST"

replace_in_file() {
  local file="$1"
  [[ -f "$file" ]] || return 0
  sed -i '' \
    -e "s/CLIENT_TRADING_NAME/${TRADING_NAME}/g" \
    -e "s/CLIENT_LEGAL_NAME/${TRADING_NAME}/g" \
    -e "s/CLIENT_PRIMARY_CONTACT/TBC/g" \
    -e "s/CLIENT_DIRECTOR_OR_OWNER/TBC/g" \
    -e "s/CLIENT_LOCATION/TBC/g" \
    -e "s/CLIENT_SERVICE_AREA/TBC/g" \
    -e "s/client-ops/${OPS_REPO_NAME}/g" \
    -e "s/client_ops/${NAME}_ops/g" \
    -e "s/client_website/${WEBSITE_REPO}/g" \
    "$file"
}

for f in \
  company/facts.yaml \
  company/website-repo.yaml \
  company/brand/branding.md \
  company/brand/voice.md \
  company/brand/design.md \
  AGENTS.md \
  HOW-IT-WORKS.md \
  dashboard/src/config/site.ts \
  .cursor/rules/client-ops-routing.mdc \
  social/brand-references.md \
  social/assets-manifest.md; do
  replace_in_file "$f"
done

if [[ "$MODE" == "external" ]]; then
  BRAND_SOURCE="ops_local"
  PLATFORM_VALUE="${PLATFORM:-null}"
  if [[ -n "$PLATFORM" ]]; then
    PLATFORM_VALUE="$PLATFORM"
  fi

  cat > company/facts.yaml <<EOF
# Machine-readable client facts for agents and automation.

client:
  legal_name: ${TRADING_NAME}
  trading_name: ${TRADING_NAME}
  location: TBC
  service_area: TBC

contacts:
  primary_contact: TBC
  director: TBC
  landline: null
  landline_tel: null
  mobile: null
  mobile_tel: null

website:
  url: ${URL}
  brand_source: ops_local
  platform: ${PLATFORM_VALUE}
  repo:
    name: null
    relative_path: null
    absolute_path: null

urls:
  public_website: ${URL}
  dashboard_netlify: ${NETLIFY_URL}

social:
  facebook: null
  instagram: null
  linkedin: null
  cross_post: []

google:
  business_profile: null

repos:
  ops:
    name: ${OPS_REPO_NAME}
    relative_path: .
    github_remote: ${GITHUB_REMOTE}

billing:
  current_source: tbc
  future_source: tbc
  hourly_rate_gbp: null

approval:
  website_code_changes: dan
  client_reports_publish: dan
  social_publish: tbc
  creative_publish: tbc

scope:
  public_website: false
  internal_client_reports: true
  secrets_in_git: false
EOF

  cat > company/website-repo.yaml <<EOF
# Pointer map for brand docs and assets (ops_local mode).
# Paths are relative to this ops repo root.

repo:
  name: null
  relative_path: null
  absolute_path: null

docs:
  brand_guidelines: company/brand/branding.md
  brand_voice: company/brand/voice.md
  design_system: company/brand/design.md

assets:
  logos: company/brand/assets/logos
  images: company/brand/assets/images

indexes: {}
EOF

else
  URL="${URL:-https://example.com}"

  cat > company/facts.yaml <<EOF
# Machine-readable client facts for agents and automation.

client:
  legal_name: ${TRADING_NAME}
  trading_name: ${TRADING_NAME}
  location: TBC
  service_area: TBC

contacts:
  primary_contact: TBC
  director: TBC
  landline: null
  landline_tel: null
  mobile: null
  mobile_tel: null

website:
  url: ${URL}
  brand_source: sibling_repo
  platform: null
  repo:
    name: ${WEBSITE_REPO}
    relative_path: ../${WEBSITE_REPO}
    absolute_path: null

urls:
  public_website: ${URL}
  dashboard_netlify: ${NETLIFY_URL}

social:
  facebook: null
  instagram: null
  linkedin: null
  cross_post: []

google:
  business_profile: null

repos:
  ops:
    name: ${OPS_REPO_NAME}
    relative_path: .
    github_remote: ${GITHUB_REMOTE}

billing:
  current_source: tbc
  future_source: tbc
  hourly_rate_gbp: null

approval:
  website_code_changes: dan
  client_reports_publish: dan
  social_publish: tbc
  creative_publish: tbc

scope:
  public_website: false
  internal_client_reports: true
  secrets_in_git: false
EOF

  cat > company/website-repo.yaml <<EOF
# Pointer map to the sibling website repository.
# Canonical brand, design, voice, and image assets live THERE.

repo:
  name: ${WEBSITE_REPO}
  relative_path: ../${WEBSITE_REPO}
  absolute_path: null

docs:
  brand_guidelines: project-core/brain/brand/branding.md
  brand_voice: project-core/brain/brand/voice.md
  design_system: project-core/brain/design/design.md
  company_overview: project-core/brain/design/company-overview.md

assets:
  logos: public/assets/logos
  images: public/assets/images
  fonts_css: public/assets/css/fonts.css
  global_css_tokens: src/styles/global.css

indexes: {}
EOF
fi

chmod +x scripts/resolve-website-asset.sh scripts/lib/brand-source.sh

cat <<EOF

Bootstrap complete: ${DEST}
Mode: ${MODE}
Brand source: $(grep 'brand_source:' company/facts.yaml | head -1 | awk '{print $2}')

Next steps:
  1. cd ${DEST}
  2. Fill remaining placeholders in company/facts.yaml (contacts, location, billing)
EOF

if [[ "$MODE" == "external" ]]; then
  cat <<EOF
  3. Populate company/brand/ (colours, voice, logos in company/brand/assets/)
  4. Add reference materials to reference/
EOF
else
  cat <<EOF
  3. Confirm sibling website repo exists at ../${WEBSITE_REPO}
  4. Update company/website-repo.yaml absolute_path if needed
EOF
fi

cat <<EOF
  5. cd dashboard && npm install && npm run dev   # preview dashboard
  6. git init && git add . && git commit -m "Bootstrap ${TRADING_NAME} ops"
  7. Create private GitHub repo and set remote to ${GITHUB_REMOTE}
  8. Configure Netlify dashboard (${NETLIFY_URL}) with password protection

EOF
