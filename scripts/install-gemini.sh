#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v gemini >/dev/null 2>&1; then
  echo "Gemini CLI is not installed or not on PATH." >&2
  exit 1
fi

cd "$ROOT"

if gemini extensions --help >/dev/null 2>&1; then
  gemini extensions link .
  echo "Linked Project + Product skills as a Gemini CLI extension."
else
  echo "This Gemini CLI build does not expose 'gemini extensions'." >&2
  exit 1
fi

