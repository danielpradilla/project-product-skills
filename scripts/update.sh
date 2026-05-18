#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-}"

cd "$ROOT"
git pull --ff-only

case "$TARGET" in
  "")
    echo "Repository updated. Run an installer if you use copy mode."
    ;;
  codex)
    "$ROOT/scripts/install-codex.sh" "${2:---link}"
    ;;
  claude)
    "$ROOT/scripts/install-claude.sh" "${2:---link}"
    ;;
  gemini)
    "$ROOT/scripts/install-gemini.sh"
    ;;
  all)
    "$ROOT/scripts/install-codex.sh" "${2:---link}"
    "$ROOT/scripts/install-claude.sh" "${2:---link}"
    "$ROOT/scripts/install-gemini.sh"
    ;;
  *)
    echo "Usage: $0 [codex|claude|gemini|all] [--link|--copy]" >&2
    exit 1
    ;;
esac

