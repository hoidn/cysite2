#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

for page in index.html research.html publications.html cv.html contact.html; do
  echo "Checking local refs in $page"
  refs="$(rg -o '(?:href|src)=\"[^\"]+\"' "$page" | sed -E 's/^(href|src)=\"([^\"]+)\"$/\2/')"

  while IFS= read -r ref; do
    [[ -z "$ref" ]] && continue

    case "$ref" in
      http*|mailto:*|\#*|data:*|javascript:*)
        continue
        ;;
    esac

    ref_path="${ref%%#*}"
    ref_path="${ref_path%%\\?*}"

    if [[ -z "$ref_path" ]]; then
      continue
    fi

    if [[ ! -e "$ref_path" ]]; then
      echo "FAIL: missing local ref '$ref' in $page"
      exit 1
    fi
  done <<< "$refs"
done

echo "PASS: local file references resolve"
