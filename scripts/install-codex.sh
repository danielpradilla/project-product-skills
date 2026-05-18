#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
MODE="link"

case "${1:-}" in
  ""|--link) MODE="link" ;;
  --copy) MODE="copy" ;;
  -h|--help)
    echo "Usage: $0 [--link|--copy]"
    echo "Default: --link"
    exit 0
    ;;
  *)
    echo "Unknown option: $1" >&2
    echo "Usage: $0 [--link|--copy]" >&2
    exit 1
    ;;
esac

mkdir -p "$TARGET"

for skill in "$ROOT"/skills/*; do
  [ -d "$skill" ] || continue
  dest="$TARGET/$(basename "$skill")"
  rm -rf "$dest"
  if [ "$MODE" = "copy" ]; then
    cp -R "$skill" "$dest"
  else
    ln -s "$skill" "$dest"
  fi
done

echo "Installed Project + Product skills into $TARGET using $MODE mode."
echo "Restart Codex so it can reload the skill list."
