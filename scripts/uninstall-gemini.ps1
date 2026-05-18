$ErrorActionPreference = "Stop"

if (-not (Get-Command gemini -ErrorAction SilentlyContinue)) {
    Write-Error "Gemini CLI is not installed or not on PATH."
    exit 1
}

gemini extensions uninstall project-product-skills
Write-Host "Uninstalled Project + Product skills from Gemini CLI."

