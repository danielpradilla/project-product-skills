$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")

if (-not (Get-Command gemini -ErrorAction SilentlyContinue)) {
    Write-Error "Gemini CLI is not installed or not on PATH."
    exit 1
}

Push-Location $Root
try {
    gemini extensions link .
    Write-Host "Linked Project + Product skills as a Gemini CLI extension."
}
finally {
    Pop-Location
}

