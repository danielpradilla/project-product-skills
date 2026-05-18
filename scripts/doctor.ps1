$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")

function Check-Command($Name) {
    $Command = Get-Command $Name -ErrorAction SilentlyContinue
    if ($Command) {
        Write-Host "PASS: $Name found ($($Command.Source))"
    } else {
        Write-Host "WARN: $Name not found"
    }
}

Write-Host "Project + Product Skills doctor"
Write-Host ""

Check-Command git
Check-Command node
Check-Command gemini
Check-Command claude
Check-Command codex

Write-Host ""
Write-Host "Install targets:"
@(
    (Join-Path $HOME ".codex\skills"),
    (Join-Path $HOME ".claude\skills")
) | ForEach-Object {
    if (Test-Path $_) {
        Write-Host "PASS: $_ exists"
    } else {
        Write-Host "WARN: $_ does not exist yet"
    }
}

Write-Host ""
& (Join-Path $Root "scripts\validate.ps1")

