#!/usr/bin/env bash
set -euo pipefail

if ! command -v gemini >/dev/null 2>&1; then
  echo "Gemini CLI is not installed or not on PATH." >&2
  exit 1
fi

if gemini extensions --help >/dev/null 2>&1; then
  gemini extensions uninstall project-product-skills
  echo "Uninstalled Project + Product skills from Gemini CLI."
else
  echo "This Gemini CLI build does not expose 'gemini extensions'." >&2
  exit 1
fi

