$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$Target = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME ".claude\skills" }

if (-not (Test-Path $Target)) {
    Write-Host "Claude skills directory does not exist: $Target"
    exit 0
}

$Removed = 0
Get-ChildItem (Join-Path $Root "skills") -Directory | ForEach-Object {
    $Dest = Join-Path $Target $_.Name
    if (Test-Path $Dest) {
        Remove-Item $Dest -Recurse -Force
        $Removed += 1
    }
}

Write-Host "Removed $Removed Project + Product skills from $Target"

