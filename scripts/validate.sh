#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0

fail() {
  echo "FAIL: $*" >&2
  errors=$((errors + 1))
}

pass() {
  echo "PASS: $*"
}

if [ -d "$ROOT/skills" ]; then
  pass "skills directory exists"
else
  fail "skills directory is missing"
fi

count=0
for skill in "$ROOT"/skills/*; do
  [ -d "$skill" ] || continue
  count=$((count + 1))
  slug="$(basename "$skill")"
  file="$skill/SKILL.md"

  [ -f "$file" ] || { fail "$slug is missing SKILL.md"; continue; }

  name="$(awk -F': *' '/^name:/ {print $2; exit}' "$file")"
  description="$(awk -F': *' '/^description:/ {print $2; exit}' "$file")"

  [ "$name" = "$slug" ] || fail "$slug has name '$name'"
  [ -n "$description" ] || fail "$slug is missing description"
done

[ "$count" -gt 0 ] && pass "$count skills found" || fail "no skills found"

for file in \
  "$ROOT/.codex-plugin/plugin.json" \
  "$ROOT/.claude-plugin/plugin.json" \
  "$ROOT/.claude-plugin/marketplace.json" \
  "$ROOT/gemini-extension.json"; do
  if [ -f "$file" ]; then
    node -e "JSON.parse(require('fs').readFileSync(process.argv[1], 'utf8'))" "$file" \
      && pass "$(basename "$file") parses" \
      || fail "$(basename "$file") does not parse"
  else
    fail "missing $file"
  fi
done

if find "$ROOT" -name '.DS_Store' -print -quit | grep -q .; then
  fail ".DS_Store files found"
else
  pass "no .DS_Store files"
fi

if grep -R -n -E --exclude-dir=.git --exclude=validate.sh --exclude=validate.ps1 'product-codex-skills|product-gemin-skills|career-story|role-scorecard' "$ROOT" >/tmp/project-product-skills-validate-grep.txt 2>/dev/null; then
  cat /tmp/project-product-skills-validate-grep.txt >&2
  fail "stale names found"
else
  pass "no stale split-repo names found"
fi

if [ "$errors" -gt 0 ]; then
  echo "Validation failed with $errors error(s)." >&2
  exit 1
fi

echo "Validation passed."
