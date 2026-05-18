#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

if [ ! -d "$TARGET" ]; then
  echo "Claude skills directory does not exist: $TARGET"
  exit 0
fi

removed=0
for skill in "$ROOT"/skills/*; do
  [ -d "$skill" ] || continue
  dest="$TARGET/$(basename "$skill")"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
    removed=$((removed + 1))
  fi
done

echo "Removed $removed Project + Product skills from $TARGET"

