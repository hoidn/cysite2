#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_files=(
  "index.html"
  "research.html"
  "publications.html"
  "cv.html"
  "contact.html"
  "styles.css"
  "main.js"
  ".nojekyll"
  ".github/workflows/pages.yml"
)

for f in "${required_files[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "FAIL: missing required file: $f"
    exit 1
  fi
done

for page in index.html research.html publications.html cv.html contact.html; do
  if ! rg -q "Chan-Ye Ohh" "$page"; then
    echo "FAIL: expected name not found in $page"
    exit 1
  fi
  if ! rg -q "styles\\.css" "$page"; then
    echo "FAIL: stylesheet link missing in $page"
    exit 1
  fi
  if ! rg -q "Home|Research|Publications|CV|Contact" "$page"; then
    echo "FAIL: global navigation labels missing in $page"
    exit 1
  fi
done

echo "PASS: site structure sanity checks"
