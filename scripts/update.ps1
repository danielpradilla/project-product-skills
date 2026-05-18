param(
    [ValidateSet("", "codex", "claude", "gemini", "all")]
    [string]$Target = "",
    [switch]$UseSymlinks
)

$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
Push-Location $Root
try {
    git pull --ff-only

    $InstallArgs = @()
    if ($UseSymlinks) {
        $InstallArgs += "-UseSymlinks"
    }

    switch ($Target) {
        "" { Write-Host "Repository updated. Run an installer if you use copy mode." }
        "codex" { & (Join-Path $Root "scripts\install-codex.ps1") @InstallArgs }
        "claude" { & (Join-Path $Root "scripts\install-claude.ps1") @InstallArgs }
        "gemini" { & (Join-Path $Root "scripts\install-gemini.ps1") }
        "all" {
            & (Join-Path $Root "scripts\install-codex.ps1") @InstallArgs
            & (Join-Path $Root "scripts\install-claude.ps1") @InstallArgs
            & (Join-Path $Root "scripts\install-gemini.ps1")
        }
    }
}
finally {
    Pop-Location
}
