#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

check_command() {
  if command -v "$1" >/dev/null 2>&1; then
    echo "PASS: $1 found ($(command -v "$1"))"
  else
    echo "WARN: $1 not found"
  fi
}

echo "Project + Product Skills doctor"
echo

check_command git
check_command bash
check_command node
check_command gemini
check_command claude
check_command codex

echo
echo "Install targets:"
for dir in "$HOME/.codex/skills" "$HOME/.claude/skills"; do
  if [ -d "$dir" ]; then
    echo "PASS: $dir exists"
  else
    echo "WARN: $dir does not exist yet"
  fi
done

echo
"$ROOT/scripts/validate.sh"

