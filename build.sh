#!/usr/bin/env bash
set -euo pipefail

# Usage: ./build.sh /path/to/target-emacs-dir
DEST="${1:-}"
if [[ -z "${DEST}" ]]; then
  echo "Usage: $0 /path/to/target-emacs-dir" >&2
  exit 2
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="${ROOT}/build"

mkdir -p "${OUT}"
mkdir -p "${DEST}"

rm -f "${OUT}/init.el" "${OUT}/early-init.el"

# Run Emacs in batch mode, minimal startup (-Q)
emacs --batch -Q --load "${ROOT}/build.el"

# Sanity checks
[[ -f "${OUT}/init.el" ]] || { echo "Missing ${OUT}/init.el" >&2; exit 1; }
[[ -f "${OUT}/early-init.el" ]] || { echo "Missing ${OUT}/early-init.el" >&2; exit 1; }

# Copy into destination
mv "${OUT}/early-init.el" "${DEST}/early-init.el"
mv "${OUT}/init.el"       "${DEST}/init.el"

echo "Deployed:"
echo "  ${DEST}/early-init.el"
echo "  ${DEST}/init.el"
