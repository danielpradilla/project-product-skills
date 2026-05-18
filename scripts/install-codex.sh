#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"

mkdir -p "$TARGET"

for skill in "$ROOT"/skills/*; do
  [ -d "$skill" ] || continue
  ln -sfn "$skill" "$TARGET/$(basename "$skill")"
done

echo "Installed Project + Product skills into $TARGET"
echo "Restart Codex so it can reload the skill list."

